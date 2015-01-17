require_relative "../lib/output"

RSpec.describe(Toolset::Output) do
    before(:all) do
        @output = Toolset::Output.new
    end

    after(:all) do
        FileUtils.rm_rf(Dir.getwd + "/toolset-output")
    end

    it("stores output in a file") do
        @output.store("example.json", "{}")

        expect(File.read("#{Dir.getwd}/toolset-output/example.json")).to eq("{}")
    end
end
