require 'esri_shapefile/model'

module EsriShapefile
  module Shapes
    #
    # A point consists of a pair of double-precision coordinates
    # in the order X,Y.
    #
    class Point
      extend EsriShapefile::Model

      field :shape_type, position: 0,  type: :integer, byte_order: :little
      field :x,          position: 4,  type: :double,  byte_order: :little
      field :y,          position: 12, type: :double,  byte_order: :little

    end
  end
end

