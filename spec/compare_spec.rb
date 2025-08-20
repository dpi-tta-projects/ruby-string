# spec/compare_spec.rb
require 'open3'

RSpec.describe "compare.rb" do
  it "prints 'equal' if strings match exactly, else 'not equal'", points: 2 do
    out1, _, st1 = Open3.capture3("ruby compare.rb", stdin_data: "apple\napple\n")
    out2, _, st2 = Open3.capture3("ruby compare.rb", stdin_data: "apple\nApple\n")

    expect(st1.exitstatus).to eq(0)
    expect(st2.exitstatus).to eq(0)

    expect(out1.strip).to eq("equal")
    expect(out2.strip).to eq("not equal")
  end

  it "uses == for exact comparison (no case folding or normalization)", points: 1 do
    src = File.read("compare.rb")
    expect(src).to match(/==/), "Use == for equality comparison."
    expect(src).not_to match(/casecmp|downcase|upcase|strip/),
      "Avoid case folding or trimming—test exact equality with ==."
  end
end
