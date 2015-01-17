require_relative "../lib/cli"

RSpec.describe(Toolset::CLI) do
    before(:all) do
        @cli = Toolset::CLI.new
    end

    after(:all) do
        FileUtils.rm_rf(Dir.getwd + "/toolset-output")
    end

    it("offers scan-project command") do
        @cli.scan_project(File.dirname(__FILE__) + "/../sample-projects/php")

        output_dir = Dir.getwd + "/toolset-output"

        expect(File.exist?(output_dir + "/php.json")).to be_truthy
        expect(File.exist?(output_dir + "/php.plain")).to be_truthy
    end

    it("offers scan-projects command") do
        output_files = [
            "bower.json", "bower.plain",
            "npm-component.json", "npm-component.plain",
            "npm-package.json", "npm-package.plain",
        ]

        @cli.scan_projects(File.dirname(__FILE__) + "/../sample-projects/js")

        output_files.each { |file|
            expect(File.exist?("#{Dir.getwd}/toolset-output/#{file}")).to be_truthy
        }
    end
end
