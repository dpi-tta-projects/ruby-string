# spec/interpolate_spec.rb
require 'open3'

RSpec.describe "interpolate.rb" do
  it "uses interpolation to format the message", points: 2 do
    stdout, stderr, status = Open3.capture3("ruby interpolate.rb", stdin_data: "Bob\nRuby\n")
    expect(status.exitstatus).to eq(0), "Script exited with non-zero status: #{stderr}"
    expect(stdout.strip).to eq("Hi Bob, welcome to Ruby!")
  end

  it "uses string interpolation (#{...}) instead of concatenation", points: 1 do
    src = File.read("interpolate.rb")
    expect(src).to match(/"#\{[^}]+\}[^"]*#\{[^}]+\}"/) # two interpolations in one string or similar
      .or match(/"#\{[^}]+\}.*"/), "Use \"...#{var}...\" to interpolate values."
    expect(src).not_to match(/\+\s*["']|["']\s*\+\s*\w+/),
      "Avoid concatenation with +; prefer interpolation."
  end
end
