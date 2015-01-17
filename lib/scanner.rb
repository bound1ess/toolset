require_relative "package-managers/manager-factory"
require_relative "output-formatters/formatter-factory"
require_relative "lang-detector"

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

        def scan_project(path, format = false)
            if not Dir.exists?(path)
                raise IOError
            end

            project_name = File.basename(path)
            project_language = @lang.detect(path)
            project_packages = []

            @managers[project_language].each { |manager|
                manager = @factories[:manager].new_manager(manager)

                begin
                    dependencies = manager.get_dependencies(path)
                rescue IOError
                    dependencies = []
                ensure
                    project_packages.concat(dependencies)
                end
            }

            project = {
                :language => project_language.to_s.downcase,
                :packages => project_packages,
            }

            if format
                report = {}

                @formatters.each { |formatter|
                    report[formatter.to_sym] =
                        @factories[:formatter].new_formatter(formatter).format(project)
                }

                project[:report] = report
            end

            {project_name.to_sym => project}
        end

        def scan_projects(path, format = false)
            if not Dir.exists?(path)
                raise IOError
            end

            result = {}

            Dir[path + "/*"].each { |project_path|
                result.merge!(scan_project(project_path, format))
            }

            result
        end
    end
end
