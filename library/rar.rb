# encoding: utf-8

require 'open3'
require 'shellwords'
require 'majic'
require 'bundler'

require 'rar/version'
require 'rar/archive'
require 'rar/command_line_options'

module RAR  
  # Set the path to the executable `rar` file.
  #
  # @return [String] The new path.
  def self.executable= executable
    @executable = executable
  end

  # @return [String] The path to the executable `rar` file.
  def self.executable
    @executable || 'rar'
  end
end
