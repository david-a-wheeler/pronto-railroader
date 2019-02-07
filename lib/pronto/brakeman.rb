require 'pronto'
require 'railroader'

module Pronto
  class Railroader < Runner
    def run
      files = ruby_patches.map do |patch|
        patch.new_file_full_path.relative_path_from(repo_path).to_s
      end

      return [] unless files.any?

      output = ::Railroader.run(app_path: repo_path,
                              output_formats: [:to_s],
                              only_files: files)
      messages_for(ruby_patches, output).compact
    rescue ::Railroader::NoApplication
      []
    end

    def messages_for(ruby_patches, output)
      output.filtered_warnings.map do |warning|
        patch = patch_for_warning(ruby_patches, warning)

        next unless patch
        line = patch.added_lines.find do |added_line|
          added_line.new_lineno == warning.line
        end

        new_message(line, warning) if line
      end
    end

    def new_message(line, warning)
      Message.new(line.patch.delta.new_file[:path], line,
                  severity_for_confidence(warning.confidence),
                  "Possible security vulnerability: #{warning.message}",
                  nil, self.class)
    end

    def severity_for_confidence(confidence_level)
      case confidence_level
      when 0 # Railroader High confidence
        :fatal
      when 1 # Railroader Medium confidence
        :warning
      else # Railroader Low confidence (and other possibilities)
        :info
      end
    end

    def patch_for_warning(ruby_patches, warning)
      ruby_patches.find do |patch|
        patch.new_file_full_path.to_s == warning.file
      end
    end
  end
end
