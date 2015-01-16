require_relative "../../lib/package-managers/bower"

RSpec.describe(Toolset::PackageManagers::Bower) do
    before(:all) do
        @bower = Toolset::PackageManagers::Bower.new
    end

    it("returns the dependencies list") do
        path = File.dirname(__FILE__) + "/../../sample-projects/js/bower"

        expect(@bower.get_dependencies(path)).to eq(["angular", "bootstrap", "jquery"])
    end

    it("will raise IOError if something goes wrong") do
        expect {
            @bower.get_dependencies("invalid-path")
        }.to raise_error(IOError)
    end
end
