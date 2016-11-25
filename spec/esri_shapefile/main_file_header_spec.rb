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
      it "extracts the file code from the first four bytes" do
        main_file_header = MainFileHeader.from_bytes(main_file_header_bytes)
        expect(main_file_header.file_code).to eql(9994)
      end
    end

  end
end

