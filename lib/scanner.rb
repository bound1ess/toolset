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
                project_name.to_sym => {
                    :language => project_language.to_s.downcase,
                    :packages => project_packages,
                },
            }

            if format
                report = {}

                @formatters.each { |formatter|
                    report[formatter.to_sym] = {
                        :name    => project_name,
                        :content => 
                            @factories[:formatter].new_formatter(formatter).format(project),
                    }
                }

                return report
            end

            project
        end

        def scan_projects(path, format = false)
            if not Dir.exists?(path)
                raise IOError
            end

            if format
                result = []
            else
                result = {}
            end

            Dir[path + "/*"].each { |project_path|
                if not format
                    result.merge!(scan_project(project_path, format))
                else
                    result.push(scan_project(project_path, format))
                end
            }

            result
        end
    end
end
