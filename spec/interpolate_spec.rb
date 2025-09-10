# spec/interpolate_spec.rb

RSpec.describe "interpolate.rb" do
  describe "output" do
    it "uses interpolation to format the message" do
      output = run_script_and_capture_lines("interpolate.rb", stdin_data: "Bob\nRuby\n")

      expect(output).to eq(["Hi Bob, welcome to Ruby!"])
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("interpolate.rb")) }

    it 'uses string interpolation (#{...}) instead of concatenation' do
      # At least one interpolation inside a double-quoted string
      expect(source_code).to match(/"[^"]*#\{[^}]+\}[^"]*"/),
        'Use double quotes with #{var} to interpolate values.'

      # No string concatenation with +
      expect(source_code).not_to match(/\+\s*["']|["']\s*\+\s*\w+/),
        'Avoid concatenation with +; prefer interpolation.'
    end
  end
end
