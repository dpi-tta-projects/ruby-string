# spec/encoding_info_spec.rb
require 'open3'

RSpec.describe "encoding_info.rb" do
  it "prints the current default string encoding name", points: 1 do
    stdout, stderr, status = Open3.capture3("ruby encoding_info.rb")
    expect(status.exitstatus).to eq(0), "Script exited with non-zero status: #{stderr}"
    expect(stdout.strip).to be_a(String)
    # Common default is UTF-8 but we won’t hardcode it; just ensure non-empty
    expect(stdout.strip.length).to be > 0
  end

  it "uses .encoding (and .name) on a string literal", points: 1 do
    src = File.read("encoding_info.rb")
    expect(src).to match(/["'][^"']*["']\.encoding(\.name)?/),
      "Call .encoding (optionally .name) on a string literal, e.g. \"test\".encoding.name"
  end
end
