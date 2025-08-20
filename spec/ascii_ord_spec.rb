# spec/ascii_ord_spec.rb
require 'open3'

RSpec.describe "ascii_ord.rb" do
  it "prints the ASCII/Unicode code of a single character", points: 2 do
    stdout, stderr, status = Open3.capture3("ruby ascii_ord.rb", stdin_data: "A\n")
    expect(status.exitstatus).to eq(0), "Script exited with non-zero status: #{stderr}"
    expect(stdout.strip).to eq("65")
  end

  it "uses .ord on a character", points: 1 do
    src = File.read("ascii_ord.rb")
    expect(src).to match(/\bord\b/), "Use .ord to get the character code."
    # Guard against using an external mapping or case/when table
    expect(src).not_to match(/case\s|\bwhen\b|\bhsh\s*=\s*\{/),
      "Don’t hardcode a mapping; use .ord."
  end
end
