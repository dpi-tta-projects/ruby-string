# spec/gsub_digits_spec.rb

RSpec.describe "gsub_digits.rb" do
  describe "output" do
    it "replaces all digits with '#'" do
      output = run_script_and_capture_lines("gsub_digits.rb", stdin_data: "I have 3 cats and 2 dogs.\n")

      expect(output).to eq(["I have # cats and # dogs."])
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("gsub_digits.rb")) }

    it "uses gsub with a regex literal (e.g., /\\d/)" do
      expect(source_code).to match(/\.gsub!?\s*\(/), "Use gsub (bang or non-bang)."
      expect(source_code).to match(/gsub!?\(\s*\/.+\/\s*,\s*["']#["']\s*\)/),
        "Use a regex literal with gsub (bang or non-bang), e.g. gsub(/\\d/, '#')."
      expect(source_code).not_to match(/gsub!?\(\s*["']/),
        "Don't use a plain string as the first gsub arg—use a regex."
    end
  end
end
