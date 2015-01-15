require "json"
require_relative "../../lib/output-formatters/json-formatter"

RSpec.describe(Toolset::OutputFormatters::JsonFormatter) do
    before(:all) do
        @formatter = Toolset::OutputFormatters::JsonFormatter.new
    end

    it("formats a structure") do
        data = {
            :key => "value",
        }

        expect(@formatter.format(data)).to eq(JSON.generate(data))
    end
end
