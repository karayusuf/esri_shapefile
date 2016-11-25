require 'esri_shapefile/model'

module EsriShapefile
  module Shapes
    #
    # A MultiPoint represents a set of points.
    #
    class MultiPoint
      extend EsriShapefile::Model

      field :shape_type, position: 0,  type: :integer, byte_order: :little
      field :x_min,      position: 4,  type: :double,  byte_order: :little
      field :y_min,      position: 12, type: :double,  byte_order: :little
      field :x_max,      position: 20, type: :double,  byte_order: :little
      field :y_max,      position: 28, type: :double,  byte_order: :little
      field :num_points, position: 36, type: :integer, byte_order: :little
      field :points,     position: 40, type: :point,   byte_order: :little # , number: :num_points

    end
  end
end

