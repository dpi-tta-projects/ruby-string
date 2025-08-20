# spec/gsub_digits_spec.rb
require 'open3'

RSpec.describe "gsub_digits.rb" do
  it "replaces all digits with '#'", points: 2 do
    stdout, stderr, status = Open3.capture3("ruby gsub_digits.rb", stdin_data: "I have 3 cats and 2 dogs.\n")
    expect(status.exitstatus).to eq(0), "Script exited with non-zero status: #{stderr}"
    expect(stdout.strip).to eq("I have # cats and # dogs.")
  end

  it "uses gsub with a regex literal (e.g., /\\d/)", points: 1 do
    src = File.read("gsub_digits.rb")
    expect(src).to match(/gsub\(\s*\/.+\/\s*,\s*["']#["']\s*\)/),
      "Use a regex literal with gsub, e.g. gsub(/\\d/, '#')."
    expect(src).not_to match(/gsub\(\s*["']/),
      "Don't use a plain string as the first gsub arg—use a regex."
  end
end
