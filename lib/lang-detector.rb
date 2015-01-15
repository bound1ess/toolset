require "json"

module Toolset
    class LangDetector
        def detect(project_path)
            # Check for PHP.
            if File.exist?(project_path + "/composer.json")
                manifest = JSON.parse(File.read(project_path + "/composer.json"))

                if manifest.key?("require") or manifest.key?("require-dev")
                    return :PHP
                end
            end

            # Check for Ruby.
            if File.exist?(project_path + "/Gemfile")
                if File.read(project_path + "/Gemfile").include?("gem")
                    return :ruby
                end
            end

            # We cannot detect it for you :(
            raise "Cannot detect the project's language (#{project_path})."
        end
    end
end
