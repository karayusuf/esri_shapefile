require 'esri_shapefile/byte_model'

module EsriShapefile
  module Shapes
    #
    # A PolyLine is an ordered set of vertices that consists of one or more
    # parts. A part is a connected sequence of two or more points. Parts may or
    # may not be connected to one another. Parts may or may not intersect one
    # another.
    #
    # Because this specification does not forbid consecutive points with
    # identical coordinates, shapefile readers must handle such cases. On the
    # other hand, the degenerate, zero length parts that might result are not
    # allowed.
    #
    class PolyLine
      extend EsriShapefile::ByteModel

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
    end
  end
end

