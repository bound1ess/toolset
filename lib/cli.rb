require "thor"

module Toolset
    class CLI < Thor
        def initialize
            @scanner = Scanner.new
        end

        desc("scan-project PATH", "Scan a project located at PATH")
        def scan_project(path)
            puts "Scanning a project located at #{path}..."
        end

        desc("scan-projects PATH", "Scan projects located at PATH")
        def scan_projects(path)
            puts "Scanning projects located at #{path}..."
        end
    end
end
