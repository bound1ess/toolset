require_relative "../../lib/output-formatters/base-formatter"

RSpec.describe(Toolset::OutputFormatters::BaseFormatter) do
    before(:all) do
        @formatter = Toolset::OutputFormatters::BaseFormatter.new
    end

    it("format() raises NotImplementedError") do
        expect {
            @formatter.format(nil)
        }.to raise_error(NotImplementedError)
    end
end
