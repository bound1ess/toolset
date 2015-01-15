require "json"

module Toolset
    module OutputFormatters
        class JsonFormatter < BaseFormatter
            def format(structure)
                JSON.generate(structure)
            end
        end
    end
end
