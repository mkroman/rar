# encoding: utf-8

module RAR
  class Archive
    # A list of messages of what the process exit code might indicate.
    ExitCodeMessages = {
      0 => 'Successful operation.',
      1 => 'Non fatal error(s) occurred.',
      2 => 'A fatal error occurred.',
      3 => 'Invalid checksum. Data is damaged.',
      4 => 'Attempt to modify an archive locked by \'k\' command.',
      5 => 'Write error.',
      6 => 'File open error.',
      7 => 'Wrong command line option.',
      8 => 'Not enough memory.',
      9 => 'File creation error.',
      10 => 'No files matching the specified mask and options were found.',
      11 => 'Wrong password.',
      255 => 'User stopped the process.'
    }

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
    # @raise ERRNO::ENOENT If the file doesn't exist.
    def add_file path
      if File.exist? path
        @files << path
      else
        raise Errno::ENOENT, "File '#{path}' doesn't exist"
      end
    end

    # Create the final archive.
    def create
      `#{command_line}`

      case $?
      when 2..11
        raise 
      else 
        return true
      end
      if $? == 0
        return true
      else
        puts "RAR command failed!"
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
