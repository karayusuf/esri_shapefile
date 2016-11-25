require 'pry'

module EsriShapefile
  module Model

    def field(name, position:, type:, byte_order:)
      attr_accessor name unless name == :unused
      fields << Field.new(name, position: position, type: type, byte_order: byte_order)
    end

    def fields
      @fields ||= []
    end

    def from_bytes(bytes)
      field_values = {}
      fields.reduce(0) do |offset, field|
        if !field.unused?
          field_values[field.name] = bytes.unpack("@#{offset}#{field.unpack_format}").first
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
