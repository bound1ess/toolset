require "json"

require_relative "base-formatter"

module Toolset
    module OutputFormatters
        class JsonFormatter < BaseFormatter
            def format(structure)
                JSON.pretty_generate(structure)
            end
        end
    end
end
