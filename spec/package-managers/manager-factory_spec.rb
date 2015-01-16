require_relative "../../lib/package-managers/manager-factory"

RSpec.describe(Toolset::PackageManagers::ManagerFactory) do
    before(:all) do
        @factory = Toolset::PackageManagers::ManagerFactory.new
    end

    it("produces a new manager factory") do
        expect(@factory.new_manager("composer"))
            .to be_an_instance_of(Toolset::PackageManagers::Composer)

        expect(@factory.new_manager("bower"))
            .to be_an_instance_of(Toolset::PackageManagers::Bower)

        expect(@factory.new_manager("NPM", false))
            .to be_an_instance_of(Toolset::PackageManagers::NPM)

        expect(@factory.new_manager("gem"))
            .to be_an_instance_of(Toolset::PackageManagers::Gem)
    end
end
