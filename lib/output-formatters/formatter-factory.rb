module Toolset
    module OutputFormatters
        class FormatterFactory
            def new_formatter(type)
                Object.const_get("Toolset::OutputFormatters::#{type.capitalize}Formatter").new
            end
        end
    end
end
