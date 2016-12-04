module EsriShapefile
  module ByteModel
    class Field
      attr_reader :name, :position, :type, :byte_order, :number

      TYPES = {
        integer: { bytesize: 4,  unpack: { big: 'l>', little: 'l<' } },
        double:  { bytesize: 8,  unpack: { big: 'G',  little: 'E'  } },
        point:   { bytesize: 16, unpack: { big: 'G',  little: 'E', multiplier: 2 } },
      }

      def initialize(name, position:, type:, byte_order:, number: nil)
        @name = name
        @position = position
        @type = type
        @number = number
        @byte_order = byte_order
      end

      def list?
        !@number.nil?
      end

      def number
        @number.nil? ? 1 : @number
      end

      def number_depends_on_field?
        @number.is_a?(Symbol)
      end

      def unused?
        name == :unused
      end

      def bytesize(values = {})
        size = TYPES[@type][:bytesize]

        if number_depends_on_field?
          multiplier = TYPES[@type][:unpack][:multiplier] || 1
          number_of_consecutive_values = number_depends_on_field? ? values[number] : number
          number_of_consecutive_values * multiplier * size
        else
          size
        end
      end

      def unpack_format(values = {})
        number_of_consecutive_values = number_depends_on_field? ? values[number] : number
        multiplier = TYPES[@type][:unpack][:multiplier] || 1
        unpack_format = TYPES[@type][:unpack][@byte_order]
        "#{unpack_format}#{number_of_consecutive_values * multiplier}"
      end
    end
  end
end
