require "json"

require_relative "base-manager"

module Toolset
    module PackageManagers
        class Bower < BaseManager
            def get_dependencies(path)
                if not File.exist?(path = path + "/bower.json")
                    raise IOError
                end

                manifest = JSON.parse(File.read(path))
                dependencies = []

                if manifest.key?("dependencies")
                    dependencies.concat(manifest["dependencies"].keys)
                end

                if manifest.key?("devDependencies")
                    dependencies.concat(manifest["devDependencies"].keys)
                end

                dependencies
            end
        end
    end
end
