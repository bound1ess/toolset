require_relative "../lib/cli"

RSpec.describe(Toolset::CLI) do
    before(:all) do
        @cli = Toolset::CLI.new
    end

    it("offers scan-project command") do
        expect(@cli.respond_to?(:scan_project)).to be_truthy
    end

    it("offers scan-projects command") do
        expect(@cli.respond_to?(:scan_projects)).to be_truthy
    end
end
