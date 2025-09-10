# spec/repeat_spec.rb

RSpec.describe "repeat.rb" do
  describe "output" do
    it "repeats a word n times using *" do
      output = run_script_and_capture_lines("repeat.rb", stdin_data: "ha\n3\n")

      expect(output).to eq(["hahaha"])
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("repeat.rb")) }

    it "uses the * operator (not loops) and converts input to integer" do
      expect(source_code).to match(/\w+\s*\*\s*\w+/), "Use the * operator to repeat the string."
      expect(source_code).to match(/.to_i/), "Convert the numeric input with .to_i."
      expect(source_code).not_to match(/\.(times|upto|downto|each)/), "Avoid loops for this exercise; use the * operator."
    end
  end
end
