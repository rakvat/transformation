#!/usr/bin/env ruby

require 'yaml'


puts "Willkommen zur 'Transformation'!"

puts "Du hast kein Bock mehr auf die Ungerechtigkeiten und Unsinnigkeiten, auf die Diskriminierung und Herrschaftsverhaeltnisse in der jetzigen Gesellschaft. Du beschliesst mitzumachen, bei der Transformation in eine moeglichst herrschaftsfreie Gesellschaft, die die Grenzen ueberwinden und mindestens drei Generationen andauern soll."

CONFIG = YAML.load_file("config.yml")

def print_possible_actions
  CONFIG["actions"].each_with_index do |action, index|
    puts "#{index}: #{action["description"]} (costs #{action["costs"]}, effects #{action["effects"]})"
  end
end

while true do
  print_possible_actions
  puts "was willst du tun? waehle die Zahl"
  input = gets.chomp
  puts input
  index = 0
  begin
    index = input.to_i
    puts "parsed #{index}"
  rescue
    puts "Du hast keine Zahl eingegeben"
    next
  end
  if index > CONFIG["actions"].length - 1
    puts "du hast keine gueltige Zahl eingegeben" 
    next
  end
  puts "fuehre Aktion '#{CONFIG["actions"][input.to_i]["description"]}' aus"
end



