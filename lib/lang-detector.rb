require "json"

module Toolset
    class LangDetector
        def detect(project_path)
            # Check for PHP.
            # Check if Composer is being used.
            if File.exist?(project_path + "/composer.json")
                manifest = JSON.parse(File.read(project_path + "/composer.json"))

                if manifest.key?("require") or manifest.key?("require-dev")
                    return :PHP
                end
            end

            # Check for Ruby.
            # Check if a Gemfile is present.
            if File.exist?(project_path + "/Gemfile")
                if File.read(project_path + "/Gemfile").include?("gem")
                    return :ruby
                end
            end

            # Check for JS.
            # Check if Bower is being used.
            if File.exist?(project_path + "/bower.json")
                if JSON.parse(File.read(project_path + "/bower.json")).key?("dependencies")
                    return :js
                end
            end

            # Check if NPM is being used.
            manifest = nil

            if File.exist?(project_path + "/package.json")
                manifest = "package"
            elsif File.exist?(project_path + "/component.json")
                manifest = "component"
            end

            if not manifest.nil?
                manifest = JSON.parse(File.read("#{project_path}/#{manifest}.json"))

                if manifest.key?("dependencies") or manifest.key?("devDependencies")
                    return :js
                end
            end

            # We cannot detect it for you :(
            raise "Cannot detect the project's language (#{project_path})."
        end
    end
end
