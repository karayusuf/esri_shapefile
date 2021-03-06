require 'spec_helper'
require 'pry'

module EsriShapefile
  module Shapes
    describe Polygon do

      let(:polygon) do
        polygon = Shapes::Polygon.new
        polygon.parts = [0,5]
        polygon.points = [
          Point.at(x: 200, y: 200),
          Point.at(x: 250, y: 250),
          Point.at(x: 300, y: 200),
          Point.at(x: 250, y: 150),
          Point.at(x: 200, y: 200),

          Point.at(x: 100, y: 200),
          Point.at(x: 250, y: 350),
          Point.at(x: 400, y: 200),
          Point.at(x: 250, y:  50),
          Point.at(x: 100, y: 200),
        ]
        polygon
      end

      describe "#rings" do
        it "foo" do
          expect(polygon.rings).to eql([
            Ring.new([
              Point.at(x: 200, y: 200),
              Point.at(x: 250, y: 250),
              Point.at(x: 300, y: 200),
              Point.at(x: 250, y: 150),
              Point.at(x: 200, y: 200),
            ]),
            Ring.new([
              Point.at(x: 100, y: 200),
              Point.at(x: 250, y: 350),
              Point.at(x: 400, y: 200),
              Point.at(x: 250, y:  50),
              Point.at(x: 100, y: 200),
            ])
          ])
        end
      end

    end
  end
end

