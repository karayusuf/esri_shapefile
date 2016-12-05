require 'esri_shapefile/byte_model'

module EsriShapefile
  module Shapes
    #
    # A shape type of 0 indicates a null shape, with no geometric data for the
    # shape. Each feature type (point, lie, polygon, etc.) supports nulls - it
    # is valid to have points and null points in the same shapefile. Often null
    # shapes are place holders; they are used during shapefile creation and are
    # populated with geometric data soon after they are created.
    #
    class Null
      include EsriShapefile::ByteModel

      field :shape_type, position: 0, type: :integer, byte_order: :little
    end
  end
end

