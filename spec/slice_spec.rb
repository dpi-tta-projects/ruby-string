# spec/slice_spec.rb
require 'open3'

RSpec.describe "slice.rb" do
  it "prints first and last character separated by a comma", points: 2 do
    stdout, stderr, status = Open3.capture3("ruby slice.rb", stdin_data: "Ruby\n")

    # NOTE: allow for pp
    stdout.gsub!("\"", "")

    expect(status.exitstatus).to eq(0), "Script exited with non-zero status: #{stderr}"
    expect(stdout.strip).to eq("R,y")
  end

  it "uses indexing/slices with []", points: 1 do
    src = File.read("slice.rb")

    # Remove prompt comments (lines starting with optional whitespace and `#`)
    src = src.lines.reject { |line| line.strip.start_with?("#") }.join

    expect(src).to match(/\[\s*0\s*\]/), "Use [0] to get the first character."
    expect(src).to match(/\[\s*-\s*1\s*\]/), "Use [-1] to get the last character."
    expect(src).not_to match(/chars\s*\.\s*first|chars\s*\.\s*last/),
      "Avoid chars.first/last; use [] indexing."
  end
end
