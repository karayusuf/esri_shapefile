module EsriShapefile
  module Converter
    class Svg

      attr_reader :shapefile_path

      def initialize(shapefile_path)
        @shapefile_path = shapefile_path
      end

      def call(output_filepath)
        File.open(output_filepath, "w") do |output_file|
          reader = EsriShapefile::Reader.new(shapefile_path)
          output_file.write(open_svg_header(reader.main_file_header))

          reader.each_record do |record_header, shape|
            output_file.write(convert_shape_to_svg(shape))
          end

          output_file.write(close_svg_header)
        end
      end

      private

      def convert_shape_to_svg(shape)
        svg = '<g>'

        shape.rings.each do |ring|
          svg << '<polygon points="'
          ring.points.each do |ring|
            svg << "#{ring.x},#{-ring.y} "
          end
          svg << '" />'
        end

        svg << "</g>"
        svg
      end

      def open_svg_header(main_file_header)
        header =  '<!DOCTYPE html>'
        header << '<html>'
        header << '<body>'

        height = main_file_header.y_max - main_file_header.y_min
        width  = main_file_header.x_max - main_file_header.x_min

        header << "<svg "
        header << " height=#{height}"
        header << " width=#{width}"
        header << " viewbox=\"#{main_file_header.x_min} #{-main_file_header.y_max} #{width} #{height}\" >"
        header
      end

      def close_svg_header
        '</svg></body></html>'
      end

    end
  end
end

