#!/usr/bin/env ruby

require 'yaml'

CONFIG = YAML.load_file("config.yml")
DEBUG = CONFIG['debug']

$LOAD_PATH << File.dirname(__FILE__)
require 'state'
require 'step'
require 'action'
require 'transformation'

transformation = Transformation.new
transformation.start

puts 'Das Spiel ist beendet. Bis zur naechsten Transformation.'
