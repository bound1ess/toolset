require_relative "../lib/scanner"

RSpec.describe(Toolset::Scanner) do
    before(:all) do
        @scanner = Toolset::Scanner.new
    end

    it("scans a project") do
        path = "#{File.dirname(__FILE__)}/../sample-projects/php"

        expect(@scanner.scan_project(path))
            .to eq({
                :php => {
                    :language => "php",
                    :packages => ["phpspec/phpspec", "phpunit/phpunit"],
                },
            })

        project = @scanner.scan_project(path, true).values.first

        expect(project).to be_a(Hash)
        expect(project[:report]).to be_a(Hash)
        expect(project[:report][:json]).to be_a(String)
        expect(project[:report][:plain]).to be_a(String)
    end

    it("raises IOError if something goes wrong") do
        expect {
            @scanner.scan_project("invalid-path")
        }.to raise_error(IOError)

        expect {
            @scanner.scan_projects("invalid-path")
        }.to raise_error(IOError)
    end

    it("scans 1+ projects") do
        path = File.dirname(__FILE__) + "/../sample-projects/js"

        expect(@scanner.scan_projects(path))
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

        projects = @scanner.scan_projects(path, true)

        expect(projects[:bower][:report]).to be_a(Hash)
    end
end
