module EsriShapefile
  module Converter
    class Svg::Polygon

      def self.to_svg(polygon)
        svg = '<g>'

        polygon.rings.each do |ring|
          svg << '<polygon points="'
          ring.points.each do |ring|
            svg << "#{ring.x},#{-ring.y} "
          end
          svg << '" />'
        end

        svg << "</g>"
        svg
      end
    end
  end
end
