require 'spec_helper'

module EsriShapefile
  describe MainFileHeader do

    let(:main_file_header_bytes) do
      bytes = "\x00\x00'\n\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"
      bytes << "\x00\x00\x00\x00\x00\x00\x00\x01|\xD2t\xE8\x03\x00\x00\x05\x00"
      bytes << "\x00\x00\xFA\xD6`\x02\xB7df\xC0\x80\xEC\xBCA?\xE92@\x12\x9A\xE3N"
      bytes << "\xE9xf@\xF2\xB4\x02\xD3\xE8\xD8Q@\x00\x00\x00\x00\x00\x00\x00\x00"
      bytes << "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"
      bytes << "\x00\x00\x00\x00\x00\x00\x00\x00"
      bytes
    end

    describe "from_bytes" do
      let(:main_file_header) do
        MainFileHeader.from_bytes(main_file_header_bytes)
      end

      it "sets the file code" do
        expect(main_file_header.file_code).to eql(9994)
      end

      it "sets the file length" do
        expect(main_file_header.file_length).to eql(24957556)
      end

      it "sets the version" do
        expect(main_file_header.version).to eql(1000)
      end

      it "sets the shape type" do
        expect(main_file_header.shape_type).to eql(5)
      end

      it "sets the x_min" do
        expect(main_file_header.x_min).to eql(-179.1473400012399)
      end

      it "sets the y_min" do
        expect(main_file_header.y_min).to eql(18.911121472000104)
      end

      it "sets the x_max" do
        expect(main_file_header.x_max).to eql(179.7784800000523)
      end

      it "sets the y_max" do
        expect(main_file_header.y_max).to eql(71.38921046509111)
      end

      it "sets the z_min" do
        expect(main_file_header.z_min).to eql(0.0)
      end

      it "sets the z_max" do
        expect(main_file_header.z_min).to eql(0.0)
      end

      it "sets the m_min" do
        expect(main_file_header.m_min).to eql(0.0)
      end

      it "sets the m_max" do
        expect(main_file_header.m_max).to eql(0.0)
      end
    end

  end
end

