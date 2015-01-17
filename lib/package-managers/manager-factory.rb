require_relative "composer"
require_relative "gem"
require_relative "npm"
require_relative "bower"

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
