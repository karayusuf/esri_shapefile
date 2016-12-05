require 'esri_shapefile/byte_model'

module EsriShapefile
  module Shapes
    #
    # A point consists of a pair of double-precision coordinates
    # in the order X,Y,Z plus a measure.
    #
    class PointZ
      include EsriShapefile::ByteModel

      field :shape_type, position: 0,  type: :integer, byte_order: :little
      field :x,          position: 4,  type: :double,  byte_order: :little
      field :y,          position: 12, type: :double,  byte_order: :little
      field :z,          position: 20, type: :double,  byte_order: :little
      field :measure,    position: 28, type: :double,  byte_order: :little

    end
  end
end

