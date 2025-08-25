# spec/bang_modify_spec.rb
require 'open3'

RSpec.describe "bang_modify.rb" do
  it "uses bang methods to modify in place (strip!, upcase!)", points: 3 do
    stdout, stderr, status = Open3.capture3("ruby bang_modify.rb", stdin_data: "   Ruby rocks   \n")

    # NOTE: allow for pp
    stdout.gsub!("\"", "")

    expect(status.exitstatus).to eq(0), "Script exited with non-zero status: #{stderr}"
    expect(stdout.strip).to eq("RUBY ROCKS")
  end

  it "uses strip! and upcase! (bang methods), not non-bang variants", points: 2 do
    src = File.read("bang_modify.rb")
    # Remove prompt comments (lines starting with optional whitespace and `#`)
    src = src.lines.reject { |line| line.strip.start_with?("#") }.join
    expect(src).to match(/.strip!/), "Use strip! to modify the string in place."
    expect(src).to match(/.upcase!/), "Use upcase! to modify the string in place."
    expect(src).not_to match(/\bstrip\b(?!\!)/), "Avoid strip (non-bang) in this exercise."
    expect(src).not_to match(/\bupcase\b(?!\!)/), "Avoid upcase (non-bang) in this exercise."
  end

  it "removes the trailing newline using chomp or chomp!", points: 1 do
    src = File.read("bang_modify.rb")
    expect(src).to match(/chomp!?/), "Remove the trailing newline using chomp/chomp!."
  end
end
