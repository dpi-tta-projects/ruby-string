# spec/regex_plural_spec.rb
require 'open3'

RSpec.describe "regex_plural.rb" do
  it "replaces 'cat'/'cats' with 'dog'/'dogs' using regex", points: 3 do
    input = "I saw one cat, two cats, and another cat."
    stdout, stderr, status = Open3.capture3("ruby regex_plural.rb", stdin_data: "#{input}\n")
    expect(status.exitstatus).to eq(0), "Script exited with non-zero status: #{stderr}"
    expect(stdout.strip).to eq("I saw one dog, two dogs, and another dog.")
  end

  it "uses a regex with optional 's' (cats?) and gsub", points: 2 do
    src = File.read("regex_plural.rb")
    expect(src).to match(/gsub\(\s*\/cats\?\//),
      "Use a regex like /cats?/ to match 'cat' or 'cats'."
    # Encourage block form to handle singular/plural logic
    expect(src).to match(/gsub\([^)]*\)\s*\{\s*\|m?\|\s*.*\}/m),
      "Use a gsub block to choose 'dog' vs 'dogs' based on the match."
  end
end
