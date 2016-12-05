require 'esri_shapefile/byte_model'

module EsriShapefile
  module Shapes
    #
    # A PolyLineM consists of one or more parts. A part is a connected sequence
    # of two or more points. Parts may or may not be connected to one another.
    # Parts may or may not intersect one another.
    #
    class PolyLineM
      include EsriShapefile::ByteModel

      field :shape_type, position: 0,  type: :integer, byte_order: :little
      field :x_min,      position: 4,  type: :double,  byte_order: :little
      field :y_min,      position: 12, type: :double,  byte_order: :little
      field :x_max,      position: 20, type: :double,  byte_order: :little
      field :y_max,      position: 28, type: :double,  byte_order: :little

      # The number of parts in the PolyLine
      field :num_parts,  position: 36, type: :integer, byte_order: :little

      # The total number of points for all parts.
      field :num_points, position: 40, type: :integer, byte_order: :little

      # An array of length num_parts. Stores, for each PolyLine, the index of
      # its first point in the points array. Array indexes are with respect to 0.
      field :parts,      position: 44, type: :integer, byte_order: :little, number: :num_parts

      # An array of length NumPoints. The points for each part in the PolyLine
      # are stored end to end. The points for Part 2 follow the points for
      # Part 1, and so on. The parts array holds the array index of the starting
      # point for each part. There is no delimiter in the points array between parts.
      field :points,     position: :x, type: :point,   byte_order: :little, number: :num_points

      # The minimum measure for the PolyLineZ
      field :m_min,      position: :z,         type: :double,  byte_order: :little

      # The maximum measure for the PolyLineZ
      field :m_max,      position: :z_plus_8,  type: :double,  byte_order: :little

      # An array of length num_points. The measures for each part in the
      # PolyLineZ are stored end to end. The measures for Part 2 follow the
      # measures for Part 1, and so on. The parts array holds the array index of
      # the starting measure for each part. There is no delimited in the measure
      # array between parts.
      field :m_array,    position: :z_plus_16, type: :double,  byte_order: :little,  number: :num_points
    end
  end
end

