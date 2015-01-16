module Toolset
    module PackageManagers
        class BaseManager
            def get_dependencies(path)
                raise NotImplementedError
            end
        end
    end
end
