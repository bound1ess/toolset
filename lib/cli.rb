require "thor"

require_relative "scanner"
require_relative "output"

module Toolset
    class CLI < Thor
        def initialize(*args)
            super

            @scanner = Scanner.new
            @output = Output.new
        end

        desc("scan-project PATH", "Scan a project located at PATH")
        def scan_project(path)
            puts "Scanning a project located at #{path}..."

            @scanner.scan_project(path, true).each { |project_name, project|
                project[:report].each { |extension, content|
                    @output.store(file = "#{project_name.to_s}.#{extension.to_s}", content)

                    puts "Writing toolset-output/#{file}..."
                }
            }
        end

        desc("scan-projects PATH", "Scan projects located at PATH")
        def scan_projects(path)
            puts "Scanning projects located at #{path}..."

            @scanner.scan_projects(path, true).keys.each { |project|
                scan_project("#{path}/#{project.to_s}")
            }
        end
    end
end
