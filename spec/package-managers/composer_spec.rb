require_relative "../../lib/package-managers/composer"

RSpec.describe(Toolset::PackageManagers::Composer) do
    before(:all) do
        @composer = Toolset::PackageManagers::Composer.new
    end

    it("returns the dependencies list") do
        path = File.dirname(__FILE__) + "/../../sample-projects/php"

        expect(@composer.get_dependencies(path)).to eq(["phpspec/phpspec", "phpunit/phpunit"])
    end

    it("will raise IOError if something goes wrong") do
        expect {
            @composer.get_dependencies("invalid-path")
        }.to raise_error(IOError)
    end
end
