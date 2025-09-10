# spec/regex_cat_spec.rb

RSpec.describe "regex_cat.rb" do
  describe "output" do
    it "replaces 'cat' with 'dog' using regex" do
      output = run_script_and_capture_lines("regex_cat.rb", stdin_data: "My cat is a cool cat.\n")

      expect(output).to eq(["My dog is a cool dog."])
    end
  end

  describe "code" do
    let(:source_code) { strip_comments(File.read("regex_cat.rb")) }

    it "uses gsub (or gsub!) with /cat/ regex" do
      expect(source_code).to match(/\.gsub!?\s*\(/), "Use gsub (or gsub!) to perform the replacement."
      expect(source_code).to match(/\/cat\//), "Use the regex /cat/ to match the word 'cat'."
    end
  end
end
