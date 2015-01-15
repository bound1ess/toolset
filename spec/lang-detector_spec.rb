require_relative "../lib/lang-detector"

RSpec.describe(Toolset::LangDetector) do
    before(:all) do
        @detector = Toolset::LangDetector.new
        @projects_dir = File.dirname(__FILE__) + "/../sample-projects"
    end

    it("detects a PHP project") do
        expect(@detector.detect("#{@projects_dir}/php")).to eq(:PHP)
    end

    it("detects a Ruby project") do
        expect(@detector.detect("#{@projects_dir}/ruby")).to eq(:ruby)
    end

    it("detects a JS project") do
        expect(@detector.detect("#{@projects_dir}/js/bower")).to eq(:js)
        expect(@detector.detect("#{@projects_dir}/js/npm-component")).to eq(:js)
        expect(@detector.detect("#{@projects_dir}/js/npm-package")).to eq(:js)
    end

    it("raises an exception if could not detect the project's language") do
        expect {
            @detector.detect("#{@projects_dir}/some-weird-language")
        }.to raise_error(RuntimeError)
    end
end
