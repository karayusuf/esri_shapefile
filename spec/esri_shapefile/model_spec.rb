require 'spec_helper'

describe EsriShapefile::ByteModel do

  describe "declaring fields" do
    let(:example_model) do
      Class.new do
        extend EsriShapefile::ByteModel
        field :foo, position: 0, type: :integer, byte_order: :little
      end
    end

    it "allows them to be accessed" do
      model = example_model.new
      model.foo = "Bar"

      expect(model.foo).to eql("Bar")
    end

    it "adds them to the list of fields" do
      expect(example_model.fields.size).to eql(1)
      expect(example_model.fields.first.name).to eql(:foo)
    end
  end
end

