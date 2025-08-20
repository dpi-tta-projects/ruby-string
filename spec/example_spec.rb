# spec/hello_spec.rb
require 'open3'

RSpec.describe "example.rb" do
  it "outputs 'hello, world'", points: 1 do
    stdout, stderr, status = Open3.capture3("ruby example.rb")

    expect(status.exitstatus).to eq(0), "Script exited with non-zero status: #{stderr}"

    # Normalize the output for both puts, pp, p, print
    stdout.gsub!("\"", "")
    stdout.gsub!("\n", "")

    expect(stdout).to eq("hello, world")
  end
end
