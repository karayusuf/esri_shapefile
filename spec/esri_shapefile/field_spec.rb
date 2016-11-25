require 'spec_helper'

module EsriShapefile
  module ByteModel
    describe Field do

      describe "type" do
        describe "integer" do
          it "has a bytesize of 4" do
            integer_field = Field.new(:integer_field, type: :integer, byte_order: :little, position: 0)
            expect(integer_field.bytesize).to eql(4)
          end

          it "correctly identifies the unpack format for the little byte order" do
            integer_field = Field.new(:integer_field, type: :integer, byte_order: :little, position: 0)
            expect(integer_field.unpack_format).to eql('l<1')
          end

          it "correctly identifies the unpack format for the big byte order" do
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

          it "correctly identifies the unpack format for the big byte order" do
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

          it "correctly identifies the unpack format for the big byte order" do
            integer_field = Field.new(:integer_field, type: :point, byte_order: :big, position: 0)
            expect(integer_field.unpack_format).to eql('G2')
          end
        end
      end

      describe "list" do
        it "is a list when a number is provided" do
          field = Field.new(:field, number: 0, type: :point, byte_order: :big, position: 0)
          expect(field).to be_a_list
        end

        it "is NOT a list when a number is NOT provided" do
          field = Field.new(:field, type: :point, byte_order: :big, position: 0)
          expect(field).to_not be_a_list
        end
      end

      describe "number attribute" do
        it "is optional" do
          field = Field.new(:field_without_number, type: :double, byte_order: :little, position: 0)
          expect(field.number).to eql(1)
          expect(field).to_not be_number_depends_on_field
        end

        it "can be an integer" do
          field = Field.new(:field_with_number, number: 42, type: :double, byte_order: :little, position: 0)
          expect(field.number).to eql(42)
          expect(field).to_not be_number_depends_on_field
        end

        it "can depend upon the value of another field" do
          field = Field.new(:field_with_depended_number, number: :num_foo, type: :double, byte_order: :little, position: 0)
          expect(field.number).to eql(:num_foo)
          expect(field).to be_number_depends_on_field
        end
      end

    end
  end

end
