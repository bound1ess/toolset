require "json"

require_relative "base-manager"

module Toolset
    module PackageManagers
        class Composer < BaseManager
            def get_dependencies(path)
                if not File.exist?(path = path + "/composer.json")
                    raise IOError
                end

                manifest = JSON.parse(File.read(path))
                dependencies = []

                if manifest.key?("require")
                    dependencies.concat(manifest["require"].keys)
                end

                if manifest.key?("require-dev")
                    dependencies.concat(manifest["require-dev"].keys)
                end

                dependencies
            end
        end
    end
end
