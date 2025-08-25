# spec/compare_spec.rb
require 'open3'

RSpec.describe "compare.rb" do
  it "prints 'true' if strings match exactly, else 'false'", points: 2 do
    out1, _, st1 = Open3.capture3("ruby compare.rb", stdin_data: "apple\napple\n")
    out2, _, st2 = Open3.capture3("ruby compare.rb", stdin_data: "apple\nApple\n")

    # NOTE: allow for pp
    out1.gsub!("\"", "")
    out2.gsub!("\"", "")

    expect(st1.exitstatus).to eq(0)
    expect(st2.exitstatus).to eq(0)

    expect(out1.strip).to eq("true")
    expect(out2.strip).to eq("false")
  end
end
