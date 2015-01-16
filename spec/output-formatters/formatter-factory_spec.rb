require_relative "../../lib/output-formatters/formatter-factory"

RSpec.describe(Toolset::OutputFormatters::FormatterFactory) do
    before(:all) do
        @factory = Toolset::OutputFormatters::FormatterFactory.new
    end

    it("produces a new formatter instance") do
        expect(@factory.new_formatter("json"))
            .to be_an_instance_of(Toolset::OutputFormatters::JsonFormatter)

        expect(@factory.new_formatter("plain"))
            .to be_an_instance_of(Toolset::OutputFormatters::PlainFormatter)
    end
end
