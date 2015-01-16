require "json"

module Toolset
    module PackageManagers
        class NPM < BaseManager
            def get_dependencies(path)
                if not path.include?("json")
                    if not Dir.exists?(path)
                        raise IOError
                    end

                    dependencies = get_dependencies(path + "/component.json")
                    dependencies.concat(get_dependencies(path + "/package.json"))

                    return dependencies
                end

                if not File.exist?(path)
                    return []
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
