require_relative "../lib/lang-detector"

RSpec.describe(Toolset::LangDetector) do
    before(:all) do
        @detector = Toolset::LangDetector.new
    end

    it("detects a PHP project") do
        project_path = File.dirname(__FILE__) + "/../sample-projects/php"

        expect(@detector.detect(project_path)).to eq(:PHP)
    end

    it("detects a Ruby project") do
        project_path = File.dirname(__FILE__) + "/../sample-projects/ruby"

        expect(@detector.detect(project_path)).to eq(:ruby)
    end

    it("detects a JS project") do
        base_project_path = File.dirname(__FILE__) + "/../sample-projects/js"

        expect(@detector.detect(base_project_path + "/bower")).to eq(:js)
        expect(@detector.detect(base_project_path + "/npm-component")).to eq(:js)
        expect(@detector.detect(base_project_path + "/npm-package")).to eq(:js)
    end
end
