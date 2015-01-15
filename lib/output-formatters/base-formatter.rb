module Toolset
    module OutputFormatters
        class BaseFormatter
            def format(structure)
                raise NotImplementedError
            end
        end
    end
end
