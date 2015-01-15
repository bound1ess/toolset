require_relative "../../lib/output-formatters/plain-formatter"

RSpec.describe(Toolset::OutputFormatters::PlainFormatter) do
    before(:all) do
        @formatter = Toolset::OutputFormatters::PlainFormatter.new
    end

    it("formats a structure") do
        data = {
            :project => {
                :language => "php",
                :packages => ["vendor/name", "another-vendor/another-name"],
            },
        }

        expectation = %{project:
            language: php
            packages:
                - vendor/name
                - another-vendor/another-name
        }

        # This way I don't have to sacrifice this file's beautiful indentation.
        expectation = expectation
            .split($/)
            .map { |line|
                line.sub(" " * 8, "")
            }
            .join($/)

        expect(@formatter.format(data)).to eq(expectation)
    end
end
