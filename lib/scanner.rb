module Toolset
    class Scanner
        def initialize
            @managers = {
                :PHP  => ["composer"],
                :ruby => ["gem"],
                :js   => ["bower", "NPM"],
            }

            @formatters = ["json", "plain"]

            @factories = {
                :manager   => PackageManagers::ManagerFactory.new,
                :formatter => OutputFormatters::FormatterFactory.new,
            }

            @lang = LangDetector.new
        end

        def scan_project(path)
            if not Dir.exists?(path)
                raise IOError
            end

            project_name = File.basename(path)
            project_language = @lang.detect(path)
            project_packages = []

            @managers[project_language].map { |manager|
                manager = @factories[:manager].new_manager(manager)

                project_packages.concat(manager.get_dependencies(path))
            }

            {
                project_name.to_sym => {
                    :language => project_language.to_s.downcase,
                    :packages => project_packages,
                },
            }
        end

        def scan_projects(path)
            # ...
        end
    end
end
