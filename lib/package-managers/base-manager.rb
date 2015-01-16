module Toolset
    module PackageManagers
        class BaseManager
            def get_dependencies
                raise NotImplementedError
            end
        end
    end
end
