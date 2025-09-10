# spec/ascii_ord_spec.rb

RSpec.describe "ascii_ord.rb" do

  describe "output" do
    it "prints the ASCII/Unicode code of a single character" do
      output = run_script_and_capture_lines("ascii_ord.rb", stdin: "A\n")
      expect(output.first).to eq("65")
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("ascii_ord.rb")) }

    it "uses .ord on a character" do
      expect(source_code).to match(/\bord\b/), "Use .ord to get the character code."
    end
  end
end
