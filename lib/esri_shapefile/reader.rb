module EsriShapefile
  class Reader

    MAIN_FILE_HEADER_BYTESIZE = 100
    RECORD_HEADER_BYTESIZE = 8

    attr_reader :main_file_header

    def initialize(path_to_shapefile)
      @path_to_shapefile = path_to_shapefile
      @main_file_header = parse_main_file_header
    end

    def each_record
      File.open(@path_to_shapefile) do |file|
        file.pos = MAIN_FILE_HEADER_BYTESIZE

        (0..Float::INFINITY).lazy.reduce(file.pos) do |current_offset, number|
          break if current_offset >= main_file_header.file_length_bytes

          record_header_bytes = file.read(RECORD_HEADER_BYTESIZE)
          record_header = RecordHeader.from_bytes(record_header_bytes)

          shape_bytes = file.read(record_header.content_length_bytes)
          shape = Shapes::Polygon.from_bytes(shape_bytes)

          yield record_header, shape

          file.pos
        end
      end
    end

    private

    def parse_main_file_header
      main_file_header_bytes = File.binread(@path_to_shapefile, 100, 0)
      MainFileHeader.from_bytes(main_file_header_bytes)
    end

  end
end

