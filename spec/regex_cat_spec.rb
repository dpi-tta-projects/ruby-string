# spec/regex_cat_spec.rb
require 'open3'

RSpec.describe "regex_cat.rb" do
  it "replaces 'cat' with 'dog' using regex", points: 3 do
    input = "My cat is a cool cat."
    stdout, stderr, status = Open3.capture3("ruby regex_cat.rb", stdin_data: "#{input}\n")

    # NOTE: allow for pp
    stdout.gsub!("\"", "")

    expect(status.exitstatus).to eq(0), "Script exited with non-zero status: #{stderr}"
    expect(stdout.strip).to eq("My dog is a cool dog.")
  end

  it "uses gsub (or gsub!) with /cat/ regex", points: 2 do
    src = File.read("regex_cat.rb")

    # Remove prompt comments (lines starting with optional whitespace and `#`)
    src = src.lines.reject { |line| line.strip.start_with?("#") }.join

    expect(src).to match(/\.gsub!?\s*\(/),
      "Use gsub (or gsub!) to perform the replacement."
    expect(src).to match(/\/cat\//),
      "Use the regex /cat/ to match the word 'cat'."
  end
end
