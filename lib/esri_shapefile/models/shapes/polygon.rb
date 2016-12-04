require 'esri_shapefile/byte_model'

module EsriShapefile
  module Shapes
    #
    # A polygon consists of one or more rings. A ring is a connected sequence of
    # four or more points that form a closed, non-self-intersecting loop. A
    # polygon may contain multiple outer rings. The order of vertices or
    # orientation for a ring indicates which side of the ring is the interior of
    # the polygon. The neighborhood to the right of an observer walking along
    # the ring in vertex order is the neighborhood inside the polygon. Vertices
    # of rings defining holes in polygons are in counterclockwise direction.
    # Vertices for a single, ringed polygon are, therefore, always in clockwise
    # order. The rings of a polygon are referred to as its parts.
    #
    # Because this specification does not forbid consecutive points with
    # identical coordinates, shapefile readers must handle such cases. On the
    # other hand, the degenerate, zero length or zero area parts that might
    # result are not allowed.
    #
    # The Polygon structure is identical to the PolyLine structure.
    #
    class Polygon
      extend EsriShapefile::ByteModel

      field :shape_type, position: 0, type: :integer, byte_order: :little
      field :x_min,      position: 4,  type: :double,  byte_order: :little
      field :y_min,      position: 12, type: :double,  byte_order: :little
      field :x_max,      position: 20, type: :double,  byte_order: :little
      field :y_max,      position: 28, type: :double,  byte_order: :little
      field :num_parts,  position: 36, type: :integer, byte_order: :little
      field :num_points, position: 40, type: :integer, byte_order: :little
      field :parts,      position: 44, type: :integer, byte_order: :little, number: :num_parts
      field :points,     position: :x, type: :point,   byte_order: :little, number: :num_points

      def to_svg
        svg = "<g>"

        rings.each do |ring|
          svg << '<polygon points="'
          ring.points.each do |ring|
            svg << "#{ring.x},#{-ring.y} "
          end
          svg << '" />'
        end

        svg << "</g>"
      end

      def rings
        @rings ||= begin
                     ring_parts = (parts + [points.size])
                     ring_parts.each_cons(2).map do |ring_start_index, next_ring_index|
                       Ring.new(points[ring_start_index...next_ring_index])
                     end
                   end
      end
    end
  end
end

