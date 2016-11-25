require 'spec_helper'

module EsriShapefile
  describe Field do

    describe "integer" do
      it "has a bytesize of 4" do
        integer_field = Field.new(:integer_field, type: :integer, byte_order: :little, position: 0)
        expect(integer_field.bytesize).to eql(4)
      end

      it "correctly identifies the unpack format for the little byte order" do
        integer_field = Field.new(:integer_field, type: :integer, byte_order: :little, position: 0)
        expect(integer_field.unpack_format).to eql('l<1')
      end

      it "correctly identifies the unpack format for the little byte order" do
        integer_field = Field.new(:integer_field, type: :integer, byte_order: :big, position: 0)
        expect(integer_field.unpack_format).to eql('l>1')
      end
    end

    describe "double" do
      it "has a bytesize of 8" do
        integer_field = Field.new(:integer_field, type: :double, byte_order: :little, position: 0)
        expect(integer_field.bytesize).to eql(8)
      end

      it "correctly identifies the unpack format for the little byte order" do
        integer_field = Field.new(:integer_field, type: :double, byte_order: :little, position: 0)
        expect(integer_field.unpack_format).to eql('E1')
      end

      it "correctly identifies the unpack format for the little byte order" do
        integer_field = Field.new(:integer_field, type: :double, byte_order: :big, position: 0)
        expect(integer_field.unpack_format).to eql('G1')
      end
    end

    describe "point" do
      it "has a bytesize of 16" do
        integer_field = Field.new(:integer_field, type: :point, byte_order: :little, position: 0)
        expect(integer_field.bytesize).to eql(16)
      end

      it "correctly identifies the unpack format for the little byte order" do
        integer_field = Field.new(:integer_field, type: :point, byte_order: :little, position: 0)
        expect(integer_field.unpack_format).to eql('E2')
      end

      it "correctly identifies the unpack format for the little byte order" do
        integer_field = Field.new(:integer_field, type: :point, byte_order: :big, position: 0)
        expect(integer_field.unpack_format).to eql('G2')
      end
    end

  end
end

