require 'spec_helper'

module EsriShapefile
  describe UnpackString do

    context "for fields" do
      it "groups consecutive values" do
        big_endian_integer_fields = [
          Model::Field.new(:foo, position: 0, type: :integer, byte_order: :big),
          Model::Field.new(:foo, position: 0, type: :integer, byte_order: :big),
          Model::Field.new(:foo, position: 0, type: :integer, byte_order: :little),
          Model::Field.new(:foo, position: 0, type: :integer, byte_order: :little),
          Model::Field.new(:foo, position: 0, type: :integer, byte_order: :big),
          Model::Field.new(:foo, position: 0, type: :integer, byte_order: :big),
        ]

        unpack_string = UnpackString.for_fields(big_endian_integer_fields)
        expect(unpack_string).to eql("l>2l<2l>2")
      end
    end

    context "for field" do
      it "returns 'l>' for big endian integers" do
        field = Model::Field.new(:foo, position: 0, type: :integer, byte_order: :big)
        expect(UnpackString.for_field(field)).to eql("l>")
      end

      it "returns 'l<' for little endian integers" do
        field = Model::Field.new(:foo, position: 0, type: :integer, byte_order: :little)
        expect(UnpackString.for_field(field)).to eql("l<")
      end

      it "returns 'G' for big endian doubles" do
        field = Model::Field.new(:foo, position: 0, type: :double, byte_order: :big)
        expect(UnpackString.for_field(field)).to eql("G")
      end

      it "returns 'E' for little endian doubles" do
        field = Model::Field.new(:foo, position: 0, type: :double, byte_order: :little)
        expect(UnpackString.for_field(field)).to eql("E")
      end
    end

  end
end
