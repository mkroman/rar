# encoding: utf-8

module RAR
  # CommandLineOptions is a convenience class to making adding new command-line
  # switches trivial.
  class CommandLineOptions < Hash
    # The mappings that convert an option to an actual command line switch.
    OptionsMap = {
      extra:        ->(extra) { extra },
      force:        ->(force) { '-y' if force },
      old_format:   ->(old_format) { '-vn' if old_format },
      volume_size:  ->(volume_size) { "-v#{volume_size}" },
      compression:  ->(compression = 0) { "-m#{compression}" },
      exclude_path: ->(exclude_path) { '-ep' },
    }

    # @return [Array] the list of command line options.
    def to_a
      map do |key, value|
        if block = OptionsMap[key]
          block.call value
        end
      end.compact
    end
  end
end
