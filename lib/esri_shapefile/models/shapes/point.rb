require 'esri_shapefile/byte_model'

module EsriShapefile
  module Shapes
    #
    # A point consists of a pair of double-precision coordinates
    # in the order X,Y.
    #
    class Point
      extend EsriShapefile::ByteModel

      field :shape_type, position: 0,  type: :integer, byte_order: :little
      field :x,          position: 4,  type: :double,  byte_order: :little
      field :y,          position: 12, type: :double,  byte_order: :little

      def self.at(x:, y:)
        point = Point.new
        point.x = x
        point.y = y
        point
      end

      def eql?(point)
        point.is_a?(Point) && point.x == x && point.y == y
      end
      alias_method :==, :eql?

    end
  end
end

