# spec/repeat_spec.rb
require 'open3'

RSpec.describe "repeat.rb" do
  it "repeats a word n times using *", points: 2 do
    stdout, stderr, status = Open3.capture3("ruby repeat.rb", stdin_data: "ha\n3\n")

    # NOTE: allow for pp
    stdout.gsub!("\"", "")

    expect(status.exitstatus).to eq(0), "Script exited with non-zero status: #{stderr}"
    expect(stdout.strip).to eq("hahaha")
  end

  it "uses the * operator (not loops) and converts input to integer", points: 1 do
    src = File.read("repeat.rb")

    # Remove prompt comments (lines starting with optional whitespace and `#`)
    src = src.lines.reject { |line| line.strip.start_with?("#") }.join

    expect(src).to match(/\w+\s*\*\s*\w+/), "Use the * operator to repeat the string."
    expect(src).to match(/.to_i/), "Convert the numeric input with .to_i."
    expect(src).not_to match(/\.(times|upto|downto|each)/),
      "Avoid loops for this exercise; use the * operator."
  end
end
