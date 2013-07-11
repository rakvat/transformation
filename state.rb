class StateOfTransformation

  @@config = CONFIG["strategies"]
  
  def initialize(idea, behavior, infrastructure)
    @idea = idea
    @behavior = behavior
    @infrastructure = infrastructure
  end

  def goal_achived?(goal)
    @idea >= goal['spread'] &&
    @behavior >= goal['establ'] &&
    @infrastructure >= goal['infrastructure']
  end

  def update(action_diff)
    @idea += action_diff.get('spread')
    @behavior += action_diff.get('establ')
    @infrastructure += action_diff.get('build')
  end

  def to_s
    "s: #{@idea}, e: #{@behavior}, b: #{@infrastructure}"  
  end

  def print
    %Q{Stand der Transformation:
  * #{@@config['spread_idea']['description']}: #{@idea}
  * #{@@config['establish_behavior_pattern']['description']}: #{@behavior}
  * #{@@config['build_infrastructure']['description']}: #{@infrastructure}}
  end
end

class StateOfWellbeing

  @@config = CONFIG["resources"]

  def initialize(happiness, time, transformers)
    @happiness = happiness
    @time = time
    @transformers = transformers
  end

  def check
    if @time <= 0
      puts "Es bleibt keine Zeit mehr zur Transformation.\n\n"
      return false
    end
    if @happiness <=0
      puts "Du hast keine Freude mehr am Leben.\n\n"
      return false
    end
    if @transformers <= 0
      puts "Kein Mensch will mehr mitmachen bei der Transformation.\n\n"
      return false
    end
    return true
  end

  def goal_achived?(goal)
    (!goal.include?('happy') || @happyness >= goal['happy']) &&
    (!goal.include?('time') || @time >= goal['time']) &&
    (!goal.include?('transformers') || @transformers >= goal['transformers'])
  end

  def update(action_diff)
    @happiness += action_diff.get('happy')
    @time += action_diff.get('time')
    @transformers += action_diff.get('transformers')
  end

  def to_s
    "h: #{@happiness}, t: #{@time}, ##{@transformers}"
  end

  def print
    %Q{Stand der Befindlichkeiten:
  * #{@@config['happiness']['description']}: #{@happiness}
  * #{@@config['time']['description']}: #{@time}
  * #{@@config['transformers']['description']}: #{@transformers}}
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
    "state: #{@transformation}, #{@wellbeing}"
  end

  def print
    if DEBUG
      return to_s
    else
    %Q{aktueller Stand: 
 #{@transformation.print} 
 #{@wellbeing.print}}
    end
  end

  def update(action_diff)
    @transformation.update(action_diff)
    @wellbeing.update(action_diff)
  end

  def check_wellbeing()
    @wellbeing.check()
  end

  def check_goal(step)
    @wellbeing.goal_achived?(step.goal) && 
      @transformation.goal_achived?(step.goal)
  end
end

