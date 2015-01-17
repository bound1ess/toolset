module Toolset
    module PackageManagers
        class ManagerFactory
            def new_manager(type, capitalize = true)
                if capitalize and not type == type.upcase
                    type.capitalize!
                end

                Object.const_get("Toolset::PackageManagers::#{type}").new
            end
        end
    end
end
