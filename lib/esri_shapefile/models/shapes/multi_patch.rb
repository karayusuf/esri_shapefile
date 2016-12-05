require 'esri_shapefile/byte_model'

module EsriShapefile
  module Shapes
    #
    #
    #
    class MultiPatch
      include EsriShapefile::ByteModel

      field :shape_type, position: 0,  type: :integer, byte_order: :little
      field :x_min,      position: 4,  type: :double,  byte_order: :little
      field :y_min,      position: 12, type: :double,  byte_order: :little
      field :x_max,      position: 20, type: :double,  byte_order: :little
      field :y_max,      position: 28, type: :double,  byte_order: :little

      field :num_parts,  position: 36, type: :integer, byte_order: :little
      field :num_points, position: 40, type: :integer, byte_order: :little
      field :parts,      position: 44, type: :integer, byte_order: :little, number: :num_parts
      field :part_types, position: :w, type: :integer, byte_order: :little, number: :num_parts
      field :points,     position: :x, type: :point,   byte_order: :little, number: :num_points

      field :z_min,      position: :x,         type: :double, byte_order: :little
      field :z_max,      position: :x_plus_8,  type: :double, byte_order: :little
      field :z_array,    position: :x_plus_16, type: :double, byte_order: :little, number: :num_points

      field :m_min,      position: :y,         type: :double, byte_order: :little
      field :m_max,      position: :y_plus_8,  type: :double, byte_order: :little
      field :m_array,    position: :y_plus_16, type: :double, byte_order: :little, number: :num_points
    end
  end
end

