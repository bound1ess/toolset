module Toolset
    module OutputFormatters
        class PlainFormatter < BaseFormatter
            def initialize
                @indentation = " " * 4
            end

            def format(structure, level = 0)
                output = ""

                structure.each do |key, value|
                    output += @indentation * level

                    if value.is_a?(String)
                        output += "#{key}: #{value}"
                    elsif not value.nil?
                        output += "#{key}:"
                    else
                        output += "- #{key}"
                    end

                    # Add a newline character.
                    output += $/

                    if value.is_a?(Array) or value.is_a?(Hash)
                        output += format(value, level + 1)
                    end
                end

                output
            end
        end
    end
end
