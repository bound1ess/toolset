require_relative "../../lib/package-managers/gem"

RSpec.describe(Toolset::PackageManagers::Gem) do
    before(:all) do
        @gem = Toolset::PackageManagers::Gem.new
    end

    it("returns the dependencies list") do
        path = File.dirname(__FILE__) + "/../../sample-projects/ruby"

        expect(@gem.get_dependencies(path)).to eq(["json", "thor", "rspec"])
    end

    it("will raise IOError if something goes wrong") do
        expect {
            @gem.get_dependencies("invalid-path")
        }.to raise_error(IOError)
    end
end
