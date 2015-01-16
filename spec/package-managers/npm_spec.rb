require_relative "../../lib/package-managers/npm"

RSpec.describe(Toolset::PackageManagers::NPM) do
    before(:all) do
        @npm = Toolset::PackageManagers::NPM.new
    end

    it("returns the dependencies list") do
        base_path = File.dirname(__FILE__) + "/../../sample-projects/js/npm"

        expect(@npm.get_dependencies("#{base_path}-component")).to eq(["mocha", "chai"])
        expect(@npm.get_dependencies("#{base_path}-package")).to eq(["chai", "karma"])
    end

    it("will raise IOError if something goes wrong") do
        expect {
            @npm.get_dependencies("invalid-path")
        }.to raise_error(IOError)
    end
end
