# spec/concat_spec.rb
require 'open3'

RSpec.describe "concat.rb" do
  it "concatenates two words with a space", points: 2 do
    stdout, stderr, status = Open3.capture3("ruby concat.rb", stdin_data: "Hello\nWorld\n")
    expect(status.exitstatus).to eq(0), "Script exited with non-zero status: #{stderr}"
    expect(stdout.strip).to eq("Hello World")
  end

  it "uses the shovel operator (<<) instead of +", points: 1 do
    src = File.read("concat.rb")
    expect(src).to match(/<<\s*["']?\s* /), "Use << to append a space and the second word."
    expect(src).not_to match(/\+\s*["']?\s* /),
      "Avoid + for concatenation in this exercise; prefer <<."
  end
end
