# spec/slice_spec.rb

RSpec.describe "slice.rb" do
  describe "output" do
    it "prints first and last character separated by a comma" do
      output = run_script_and_capture_lines("slice.rb", stdin_data: "Ruby\n")

      expect(output).to eq(["R,y"])
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("slice.rb")) }

    it "uses indexing/slices with []" do
      expect(source_code).to match(/\[\s*0\s*\]/), "Use [0] to get the first character."
      expect(source_code).to match(/\[\s*-\s*1\s*\]/), "Use [-1] to get the last character."
      expect(source_code).not_to match(/chars\s*\.\s*first|chars\s*\.\s*last/), "Avoid chars.first/last; use [] indexing."
    end
  end
end
