require_relative "../lib/scanner"

RSpec.describe(Toolset::Scanner) do
    before(:all) do
        @scanner = Toolset::Scanner.new
    end

    it("scans a project") do
        expect(@scanner.scan_project(File.dirname(__FILE__) + "/../sample-projects/php"))
            .to eq({
                :php => {
                    :language => "php",
                    :packages => ["phpspec/phpspec", "phpunit/phpunit"],
                },
            })
    end

    it("raises IOError if something goes wrong") do
        expect {
            @scanner.scan_project("invalid-path")
        }.to raise_error(IOError)
    end

    it("scans 1+ projects") do
        expect(@scanner.scan_projects(File.dirname(__FILE__) + "/../sample-projects/js"))
            .to eq({
                :bower => {
                    :language => "js",
                    :packages => ["angular", "bootstrap", "jquery"],
                },
                :"npm-component" => {
                    :language => "js",
                    :packages => ["mocha", "chai"],
                },
                :"npm-package" => {
                    :language => "js",
                    :packages => ["chai", "karma"],
                },
            })
    end
end
