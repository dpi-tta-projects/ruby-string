# spec/greet_spec.rb

RSpec.describe "greet.rb" do
  describe "output" do
    it "greets using gets.chomp and interpolation" do
      output = run_script_and_capture_lines("greet.rb", stdin_data: "Alice\n")

      expect(output.last).to eq("Hello, Alice!")
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("greet.rb")) }

    it 'uses gets.chomp on the same line and interpolation #{...}' do
      expect(source_code).to match(/gets\.chomp/), "Use gets.chomp to remove the newline."
      expect(source_code).not_to match(/gets\s*\)\s*\.\s*chomp/m),
        "Call chomp directly on gets, e.g., name = gets.chomp."
      expect(source_code).to match(/"Hello, #\{[^}]+\}!"/), "Use interpolation to format the greeting."
      expect(source_code).not_to match(/\+\s*["']|["']\s*\+\s*\w+/),
        "Avoid concatenation with +; prefer interpolation."
    end
  end
end
