require 'esri_shapefile/byte_model'

module EsriShapefile
  #
  # The header for each record stores the record number and content length for
  # the record. Record headers have a fixed length of 8 bytes. The list of
  # fields shows the fields in the record header with their byte position, type,
  # and byte order. The field position is with respect to the start of the
  # record.
  #
  class RecordHeader
    include EsriShapefile::ByteModel

    # Record numbers begin at 1.
    field :record_number,  position: 0, type: :integer, byte_order: :big

    # The content length for a record is the length of the record contents
    # section measured in 16-bit words. Each record, therefore, contributes (4 +
    # content_length) 16-bit words toward the total length of the file, as
    # stored as Byte 24 in the file header.
    field :content_length, position: 4, type: :integer, byte_order: :big

    def content_length_bytes
      content_length * 2
    end
  end
end

