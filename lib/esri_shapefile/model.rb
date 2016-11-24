require 'pry'

module EsriShapefile
  module Model

    def field(name, position:, type:, byte_order:)
      attr_accessor name
      fields << Field.new(name, position: position, type: type, byte_order: byte_order)
    end

    def fields
      @fields ||= []
    end

    def from_bytes(bytes)
      model = self.new

      unpack_string = UnpackString.for_fields(fields)
      values = bytes.unpack(unpack_string)
      values.each_with_index do |value, index|
        model.send("#{fields[index].name}=", value)
      end

      model
    end

    class Field
      attr_reader :name, :position, :type, :byte_order

      def initialize(name, position:, type:, byte_order:)
        @name = name
        @position = position
        @type = type
        @byte_order = byte_order
      end
    end

  end
end
