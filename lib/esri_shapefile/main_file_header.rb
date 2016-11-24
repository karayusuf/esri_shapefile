require 'esri_shapefile/model'

module EsriShapefile
  #
  # The main file header is 100 bytes long. The fields in the file header are
  # listed below with their byte position, type, and byte order. Position is
  # with respect to the start of the file.
  #
  class MainFileHeader
    extend EsriShapefile::Model

    field :file_code,   position:  0, type: :integer, byte_order: :big
    field :unused,      position:  4, type: :integer, byte_order: :big
    field :unused,      position:  8, type: :integer, byte_order: :big
    field :unused,      position: 12, type: :integer, byte_order: :big
    field :unused,      position: 16, type: :integer, byte_order: :big
    field :unused,      position: 20, type: :integer, byte_order: :big

    # The value for file length is the total length of the file in 16-bit words
    # (including the fifty 16-bit words that make up the header).
    field :file_length, position: 24, type: :integer, byte_order: :big
    field :version,     position: 28, type: :integer, byte_order: :little
    field :shape_type,  position: 32, type: :integer, byte_order: :little

    field :x_min,       position: 36, type: :double,  byte_order: :little
    field :y_min,       position: 44, type: :double,  byte_order: :little
    field :x_max,       position: 52, type: :double,  byte_order: :little
    field :y_max,       position: 60, type: :double,  byte_order: :little

    field :z_min,       position: 68, type: :double,  byte_order: :little
    field :z_max,       position: 76, type: :double,  byte_order: :little
    field :m_min,       position: 84, type: :double,  byte_order: :little
    field :m_max,       position: 92, type: :double,  byte_order: :little

    # def self.from_bytes(bytes)
    #   values = bytes.unpack('N7V2E8')

    #   main_file_header = self.new
    #   main_file_header.file_code = values[0]
    #   main_file_header
    # end
  end
end

