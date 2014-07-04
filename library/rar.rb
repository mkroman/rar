# encoding: utf-8

require 'open3'
require 'shellwords'

require 'rar/version'
require 'rar/archive'
require 'rar/command_line_options'

module RAR
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
