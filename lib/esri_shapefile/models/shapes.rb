module EsriShapefile
  module Shapes

    # Shape types not specified below (2, 4, 6, etc., and up to 33) are
    # reserved for future use
    SHAPES = {
      0  => Shapes::Null,
      1  => Shapes::Point,
      3  => Shapes::PolyLine,
      5  => Shapes::Polygon,
      8  => Shapes::MultiPoint,
      11 => Shapes::PointZ,
      13 => Shapes::PolyLineZ,
      15 => Shapes::PolygonZ,
      18 => Shapes::MultiPointZ,
      21 => Shapes::PointM,
      23 => Shapes::PolyLineM,
      25 => Shapes::PolygonM,
      28 => Shapes::MultiPointM,
      31 => Shapes::MultiPatch,
    }

    def self.find_by_type(shape_type)
      SHAPES.fetch(shape_type)
    end

    def self.find_by_bytes(bytes)
      shape_type = bytes.unpack('l<').first
      find_by_type(shape_type)
    end

  end
end
