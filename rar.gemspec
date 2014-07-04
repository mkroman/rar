#!/usr/bin/gem build
# encoding: utf-8

$:.unshift File.dirname(__FILE__) + '/library'
require 'rar/version'

Gem::Specification.new do |spec|
  # The project description.
  spec.name    = 'rar'
  spec.version = RAR::Version
  spec.summary = %{RAR is a Ruby wrapper for the command-line application rar, also known as WinRAR for Windows.}
  spec.description = <<-eos
    RAR is a Ruby wrapper for the command-line application rar, also known as WinRAR for Windows.
  eos

  # The project homepage.
  spec.homepage = 'https://github.com/mkroman/rar'

  # The project license.
  spec.license = 'MIT'

  # The author(s) full name.
  spec.author  = 'Mikkel Kroman'

  # The author(s) e-mail address.
  spec.email   = 'mk@uplink.io'

  # The exported files.
  spec.files = Dir['library/**/*.rb', 'README.md', 'LICENSE', '.yardopts']

  # The library directory.
  spec.require_path = 'library'

  # The dependencies.
  spec.add_development_dependency 'rspec', '~> 3.0', '>= 3.0.0'
  spec.add_development_dependency 'guard', '~> 2.6'
  spec.add_development_dependency 'guard-rspec', '~> 4.2'
end

# vim: set syntax=ruby
