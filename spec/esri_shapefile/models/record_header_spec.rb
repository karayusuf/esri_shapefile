require 'spec_helper'

module EsriShapefile
  describe RecordHeader do

    let(:record_header_bytes) do
      "\x00\x00\x00\x01\x00\x00\x00\x04"
    end

    describe "from_bytes" do
      let(:record_header) do
        RecordHeader.from_bytes(record_header_bytes)
      end

      it "sets the record number" do
        expect(record_header.record_number).to eql(1)
      end

      it "sets the content length" do
        expect(record_header.content_length).to eql(4)
      end
    end

  end
end

