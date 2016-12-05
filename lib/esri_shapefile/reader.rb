require 'pathname'
require 'dbf'

module EsriShapefile
  class Reader

    MAIN_FILE_HEADER_BYTESIZE = 100
    RECORD_HEADER_BYTESIZE = 8

    attr_reader :main_file_header

    def initialize(path_to_shapefile)
      @path_to_shapefile = Pathname.new(path_to_shapefile)
      @path_to_dbf = @path_to_shapefile.sub_ext(".dbf")

      @main_file_header = parse_main_file_header
    end

    def each_record
      dbf = @path_to_dbf.file? ? DBF::Table.new(@path_to_dbf.to_s) : nil

      File.open(@path_to_shapefile) do |file|
        file.pos = MAIN_FILE_HEADER_BYTESIZE

        (0..Float::INFINITY).lazy.reduce(file.pos) do |current_offset, _|
          break if current_offset >= main_file_header.file_length_bytes

          record_header_bytes = file.read(RECORD_HEADER_BYTESIZE)
          record_header = RecordHeader.from_bytes(record_header_bytes)

          shape_bytes = file.read(record_header.content_length_bytes)
          shape_class = Shapes.find_by_bytes(shape_bytes)

          shape = shape_class.from_bytes(shape_bytes)
          shape.metadata = get_record_metadata(dbf, record_header.record_number)

          yield record_header, shape

          file.pos
        end
      end
    end

    private

    # Retrieve the metadata for the shape from the associated .dbf file.
    # Record numbers are one based, while the dbf file reader is 0 based.
    # So we subtract one from the record number when performing the lookup.
    def get_record_metadata(dbf, record_number)
      dbf.nil? ? {} : dbf.find(record_number - 1).attributes
    end

    def parse_main_file_header
      main_file_header_bytes = File.binread(@path_to_shapefile, 100, 0)
      MainFileHeader.from_bytes(main_file_header_bytes)
    end

  end
end

