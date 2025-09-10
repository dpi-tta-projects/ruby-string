# spec/concat_spec.rb

RSpec.describe "concat.rb" do
  describe "output" do
    it "concatenates two words with a space" do
      output = run_script_and_capture_lines("concat.rb", stdin_data: "Hello\nWorld\n")

      expect(output).to eq(["Hello World"])
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("concat.rb")) }

    it "uses the shovel operator (<<) instead of +" do
      expect(source_code).to match(/<<\s*["']?\s* /),     "Use << to append a space and the second word."
      expect(source_code).not_to match(/\+\s*["']?\s* /), "Avoid + for concatenation in this exercise; prefer <<."
    end
  end
end
