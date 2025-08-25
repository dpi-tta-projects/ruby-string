# spec/interpolate_spec.rb
require 'open3'

RSpec.describe "interpolate.rb" do
  it "uses interpolation to format the message", points: 2 do
    stdout, stderr, status = Open3.capture3("ruby interpolate.rb", stdin_data: "Bob\nRuby\n")

    # Normalize the output for both puts, pp, p, print
    stdout.gsub!("\"", "")

    expect(status.exitstatus).to eq(0), "Script exited with non-zero status: #{stderr}"
    expect(stdout.strip).to eq("Hi Bob, welcome to Ruby!")
  end

  it 'uses string interpolation (#{...}) instead of concatenation', points: 1 do
    src = File.read("interpolate.rb")

    # Remove prompt comments (lines starting with optional whitespace and `#`)
    src = src.lines.reject { |line| line.strip.start_with?("#") }.join

    # At least one interpolation inside a double-quoted string
    expect(src).to match(/"[^"]*#\{[^}]+\}[^"]*"/),
      'Use double quotes with #{var} to interpolate values.'

    # No string concatenation with +
    expect(src).not_to match(/\+\s*["']|["']\s*\+\s*\w+/),
      'Avoid concatenation with +; prefer interpolation.'
  end
end
