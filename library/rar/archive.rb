# encoding: utf-8

module RAR
  class Archive
    # @return [Array] The list of files.
    attr_accessor :files

    # @return [Hash] The list of options.
    attr_accessor :options

    # Create a new archive.
    def initialize options = {}
      @files = []
      @options = options
    end

    # Add a file to the list of files.
    #
    # @return [Array] The list of files.
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
      Open3.popen3 command_line do |stdin, stdout, stderr, wait_thread|
      end
    end

  private

    # @return [String] The concatenated command-line with all the switches.
    def command_line
      %{#{RAR.executable} a -idcd output.rar #{Shellwords.join @files}}
    end
  end
end
