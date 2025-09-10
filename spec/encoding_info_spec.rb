# spec/encoding_info_spec.rb

RSpec.describe "encoding_info.rb" do
  describe "output" do
    it "prints the current default string encoding name" do
      output = run_script_and_capture_lines("encoding_info.rb")

      # Common default is UTF-8 but we won’t hardcode it; just ensure non-empty
      expect(output.length).to be > 0
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("encoding_info.rb")) }

    it "uses .encoding (and .name) on a string literal" do
      expect(source_code).to match(/["'][^"']*["']\.encoding(\.name)?/),
        "Call .encoding (optionally .name) on a string literal, e.g. \"test\".encoding.name"
    end
  end
end
