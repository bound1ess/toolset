module Toolset
    module PackageManagers
        class Gem < BaseManager
            def get_dependencies(path)
                if not File.exist?(path = path + "/Gemfile")
                    raise IOError
                end

                gemfile = File.read(path)

                gemfile.scan(/gem\s(.+)/).map { |gem|
                    gem.first[1...-1]
                }
            end
        end
    end
end
