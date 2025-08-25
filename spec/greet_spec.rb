# spec/greet_spec.rb
require 'open3'

RSpec.describe "greet.rb" do
  it "greets using gets.chomp and interpolation", points: 2 do
    stdout, stderr, status = Open3.capture3("ruby greet.rb", stdin_data: "Alice\n")
    expect(status.exitstatus).to eq(0), "Script exited with non-zero status: #{stderr}"

    # NOTE: allow for pp
    stdout.gsub!("\"", "")

    # Extract last line to ignore the prompt
    line = stdout.lines.last&.strip
    expect(line).to eq("Hello, Alice!")
  end

  it 'uses gets.chomp on the same line and interpolation #{...}', points: 2 do
    src = File.read("greet.rb")
    expect(src).to match(/gets\.chomp/), "Use gets.chomp to remove the newline."
    expect(src).not_to match(/gets\s*\)\s*\.\s*chomp/m),
      "Call chomp directly on gets, e.g., name = gets.chomp."
    expect(src).to match(/"Hello, #\{[^}]+\}!"/), "Use interpolation to format the greeting."
    expect(src).not_to match(/\+\s*["']|["']\s*\+\s*\w+/),
      "Avoid concatenation with +; prefer interpolation."
  end
end
