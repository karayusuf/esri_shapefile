require 'pry'

module EsriShapefile
  module ByteModel

    def field(name, number: nil, position:, type:, byte_order:)
      attr_accessor name unless name == :unused
      fields << Field.new(name, position: position, type: type, byte_order: byte_order, number: number)
    end

    def fields
      @fields ||= []
    end

    def from_bytes(bytes)
      field_values = {}
      fields.reduce(0) do |offset, field|
        if !field.unused?
          unpack_format = field.unpack_format(field_values)
          field_value = bytes.unpack("@#{offset}#{unpack_format}")
          field_values[field.name] = field.list? ? field_value : field_value.first
        end

        offset += field.bytesize
        (offset < bytes.size) ? offset : break
      end

      field_values.reduce(self.new) do |model, (field, value)|
        model.send("#{field}=", value)
        model
      end
    end

  end
end
