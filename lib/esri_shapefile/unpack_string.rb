module EsriShapefile
  class UnpackString

    TYPES = {
      integer: { big: 'l>', little: 'l<' },
      double:  { big: 'G',  little: 'E' },
    }

    def self.for_fields(fields)
      fields.
        map { |field| for_field(field) }.chunk(&:to_s).
        map { |field, group| "#{field}#{group.size}" }.
        join("")
    end

    def self.for_field(field)
      TYPES[field.type][field.byte_order]
    end

  end
end

