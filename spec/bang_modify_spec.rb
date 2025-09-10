# spec/bang_modify_spec.rb

RSpec.describe "bang_modify.rb" do
  describe "output" do
    it "uses bang methods to modify in place (strip!, upcase!)" do
      output = run_script_and_capture_lines("bang_modify.rb", stdin: "   Ruby rocks   \n")

      expect(output).to eq(["RUBY ROCKS"])
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("bang_modify.rb")) }

    it "uses strip! and upcase! (bang methods), not non-bang variants" do
      expect(source_code).to match(/.strip!/), "Use strip! to modify the string in place."
      expect(source_code).to match(/.upcase!/), "Use upcase! to modify the string in place."
      expect(source_code).not_to match(/\bstrip\b(?!\!)/), "Avoid strip (non-bang) in this exercise."
      expect(source_code).not_to match(/\bupcase\b(?!\!)/), "Avoid upcase (non-bang) in this exercise."
    end

    it "removes the trailing newline using chomp or chomp!" do
      expect(source_code).to match(/chomp!?/), "Remove the trailing newline using chomp/chomp!."
    end
  end
end
