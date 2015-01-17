module Toolset
    class Output
        def store(file_name, content)
            output_dir = Dir.getwd + "/toolset-output"

            Dir.mkdir(output_dir) unless Dir.exists?(output_dir)

            File.write("#{output_dir}/#{file_name}", content)
        end
    end
end
