#!/usr/bin/env ruby
# encoding: utf-8

$:.unshift File.dirname(__FILE__) + '/library'

require 'rar'

archive = RAR::Archive.new
archive.add_file 'test.mp4'
archive.create
