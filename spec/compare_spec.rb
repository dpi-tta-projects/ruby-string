# spec/compare_spec.rb

RSpec.describe "compare.rb" do
  describe "output" do
    it "prints 'true' if strings match exactly" do
      output = run_script_and_capture_lines("bang_modify.rb", stdin: "apple\napple\n")

      expect(output.first).to eq("true")
    end

    it "prints 'false' if strings don't match exactly" do
      output = run_script_and_capture_lines("bang_modify.rb", stdin: "apple\nApple\n")

      expect(output.first).to eq("false")
    end
  end
end
