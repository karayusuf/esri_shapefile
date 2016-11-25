module EsriShapefile
  module Shapes
    describe Point do

      describe "from_bytes" do
        let(:point_bytes) { [1, 42, 57].pack('l<EE') }
        let(:point) { Point.from_bytes(point_bytes) }

        it "sets the shape_type" do
          expect(point.shape_type).to eql(1)
        end

        it "sets the x coordinate" do
          expect(point.x).to eql(42.0)
        end

        it "sets the y coordinate" do
          expect(point.y).to eql(57.0)
        end
      end
    end
  end
end

