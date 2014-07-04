# encoding: utf-8

require 'open3'
require 'shellwords'

require 'rar/version'
require 'rar/archive'
require 'rar/command_line_options'

module RAR
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

  # The standard error for unexpected exit codes.
  CommandLineError = Class.new StandardError

  # Set the path to the executable `rar` file.
  #
  # @return [String] the new path to the executable.
  def self.executable= executable
    @executable = executable
  end

  # @return [String] the path to the executable `rar` file.
  def self.executable
    @executable || 'rar'
  end
end
