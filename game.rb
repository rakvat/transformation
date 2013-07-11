#!/usr/bin/env ruby

require 'yaml'

DEBUG = true
CONFIG = YAML.load_file("config.yml")

$LOAD_PATH << File.dirname(__FILE__)
require 'state'
require 'step'
require 'transformation'

transformation = Transformation.new
transformation.start

puts 'Das Spiel ist beendet. Bis zur naechsten Transformation.'
