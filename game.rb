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

class StateOfTransformation
  def initialize(idea, behavior, infrastructure)
    @idea = idea
    @behavior = behavior
    @infrastructure = infrastructure
    @config = CONFIG["strategies"]
  end

  def goal_achived?(goal)
    @idea >= goal['spread'] &&
    @behavior >= goal['establ'] &&
    @infrastructure >= goal['infrastructure']
  end

  def update(transform)
    @idea += transform['spread'] if transform.include?('spread')
    @behavior += transform['establ'] if transform.include?('establ')
    @infrastructure += transform['build'] if transform.include?('build')
  end

  def to_s()
    %Q{Stand der Transformation:
  * #{@config['spread_idea']['description']}: #{@idea}
  * #{@config['establish_behavior_pattern']['description']}: #{@behavior}
  * #{@config['build_infrastructure']['description']}: #{@infrastructure}}
  end
end

class StateOfWellbeing
  def initialize(happiness, time, transformers)
    @happiness = happiness
    @time = time
    @transformers = transformers
    @config = CONFIG["resources"]
  end

  def check
    if @time <= 0
      puts "es bleibt keine Zeit mehr zur Transformation"
      return false
    end
    if @happiness <=0
      puts "du hast keine Freude mehr am Leben"
      return false
    end
    if @transformers <= 0
      puts "ein Mensch will mehr mitmachen bei der Transformation"
      return false
    end
    return true
  end

  def update(transform)
    @happiness += transform['happy'] if  transform.include?('happy')
    @time += transform['time'] if transform.include?('time')
    @transformers += transform['transformers'] if transform.include?('transformers')
  end

  def to_s()
    %Q{Stand der Befindlichkeiten:
  * #{@config['happiness']['description']}: #{@happiness}
  * #{@config['time']['description']}: #{@time}
  * #{@config['transformers']['description']}: #{@transformers}}
  end
end

class State

  def initialize(state_of_start)
    @transformation = StateOfTransformation.new(
                        state_of_start['spread'],
                        state_of_start['establ'],
                        state_of_start['build'])
    @wellbeing = StateOfWellbeing.new(
                        state_of_start['happy'],
                        state_of_start['time'],
                        state_of_start['transformers'])
  end

  def to_s
    %Q{aktueller Stand: 
 #{@transformation} 
 #{@wellbeing}}
  end

  def update(transform)
    @transformation.update(transform)
    @wellbeing.update(transform)
  end

  def check_wellbeing()
    @wellbeing.check()
  end

  def check_goal(step)
    @transformation.goal_achived?(step.goal)
  end
end

class Step
  def initialize(config)
    @start = config["start"]
    @goal = config["goal"]
  end

  def start
    @start
  end

  def goal
    @goal
  end
end

#initialize
steps = []
CONFIG['steps'].each do |step|
  steps << Step.new(step)
end

current_step = steps[0]
state = State.new(current_step.start)

#game loop
while true do
  puts "---------------------------"
  puts state
  print_possible_actions
  puts "was willst du tun? waehle die Zahl"
  input = gets.chomp
  index = 0
  begin
    index = Integer(input)
  rescue
    puts "Du hast keine Zahl eingegeben"
    next
  end
  if index > CONFIG['actions'].length - 1
    puts "du hast keine gueltige Zahl eingegeben" 
    next
  end
  action = CONFIG['actions'][index]
  puts "fuehre Aktion '#{action['description']}' aus"

  state.update(action['costs'])
  break if not state.check_wellbeing() 
  state.update(action['effects'])
  puts state
  break if not state.check_wellbeing()
  break if state.check_goal(current_step)
end



