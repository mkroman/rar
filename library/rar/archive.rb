# encoding: utf-8

module RAR
  # The Archive class.
  #
  # It is the main entry-point to creating a new archive.
  class Archive
    # @return [Array] the list of files.
    attr_accessor :files

    # @return [Hash] the list of options.
    attr_accessor :options

    # Create a new archive.
    #
    # @param [String] filename The archive's file name.
    # @param [CommandLineOptions, optional] options The options to pass to the
    #   command line.
    #
    # @option options [String] :extra A string of command line options that will
    #   be passed directly to the command line.
    # @option options [Boolean] :force Assume Yes on all queries.
    # @option options [Boolean] :old_format Use the old style volume naming
    #   scheme.
    # @option options [Fixnum, String] :volume_size The volume size in case of
    #   multiple volumes.
    # @option options [Fixnum] :compression Set compression level.
    #   (0-store...3-default...5-maximal)
    # @option options [Boolean] :exclude_path Exclude paths from names.
    def initialize filename, options = {}
      @files = []
      @options = CommandLineOptions.new.merge options
      @filename = filename
    end

    # Add a file to the list of files.
    #
    # @return [Array] the list of files.
    # @raise ERRNO::ENOENT if the file doesn't exist.
    def add_file path
      if File.exist? path
        @files << path
      else
        raise Errno::ENOENT, "File '#{path}' doesn't exist"
      end
    end

    # Create the final archive.
    #
    # @return true if the command executes without a hitch.
    # @raise CommandLineError if the exit code indicates an error.
    def create!
      rar_process = IO.popen command_line

      # Wait for the child rar process to finish.
      _, exit_status = Process.wait2 rar_process.pid

      if exit_status.to_i > 1
        if message = ExitCodeMessages[exit_status.to_i]
          raise CommandLineError, message
        else
          raise CommandLineError, "Unknown exit status: #{exit_status}"
        end
      else
        true
      end
    end

    private

    # @return [String] the concatenated list of command-line switches.
    def command_line_options
      Shellwords.join @options.to_a
    end

    # @return [String] the concatenated command-line with all the switches.
    def command_line
      %{#{RAR.executable} a #{command_line_options} #{Shellwords.escape @filename} #{Shellwords.join @files}}
    end
  end
end
