require "thor"

module Toolset
    class CLI < Thor
        def initialize
            @scanner = Scanner.new
            @output = Output.new
        end

        desc("scan-project PATH", "Scan a project located at PATH")
        def scan_project(path)
            puts "Scanning a project located at #{path}..."

            @scanner.scan_project(path, true).each { |extension, report|
                @output.store(file = "#{report[:name]}.#{extension}", report[:content])

                puts "Writing toolset-output/#{file}..."
            }
        end

        desc("scan-projects PATH", "Scan projects located at PATH")
        def scan_projects(path)
            puts "Scanning projects located at #{path}..."

            @scanner.scan_projects(path, true).each { |report|
                scan_project("#{path}/#{report[report.keys.first][:name]}")
            }
        end
    end
end
