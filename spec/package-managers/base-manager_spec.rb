require_relative "../../lib/package-managers/base-manager"

RSpec.describe(Toolset::PackageManagers::BaseManager) do
    before(:all) do
        @manager = Toolset::PackageManagers::BaseManager.new
    end

    it("get_dependencies() raises NotImplementedError") do
        expect {
            @manager.get_dependencies(nil)
        }.to raise_error(NotImplementedError)
    end
end
