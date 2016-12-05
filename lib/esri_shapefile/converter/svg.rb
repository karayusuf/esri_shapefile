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
            shape_converter = get_shape_converter(shape)
            output_file.write(shape_converter.to_svg(shape))
          end

          output_file.write(close_svg_header)
        end
      end

      private

      def get_shape_converter(shape)
        case
        when Shapes::Polygon then Svg::Polygon
        else raise "Shape not supported"
        end
      end

      def open_svg_header(main_file_header)
        header =  '<!DOCTYPE html>'
        header << '<html>'
        header << '<body>'

        height = main_file_header.y_max - main_file_header.y_min
        width  = main_file_header.x_max - main_file_header.x_min

        header << "<svg "
        header << " height=\"100%\""
        header << " width=\"100%\""
        header << " viewbox=\"#{main_file_header.x_min} #{-main_file_header.y_max} #{width} #{height}\" >"
        header
      end

      def close_svg_header
        '</svg></body></html>'
      end

    end
  end
end

