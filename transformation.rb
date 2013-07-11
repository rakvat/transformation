class Transformation

  #initialize steps
  @@steps = []
  CONFIG['steps'].each do |step|
    @@steps << Step.new(step)
  end

  @@actions = []
  CONFIG['actions'].each do |action|
    @@actions << Action.new(action)
  end

  def initialize
    puts "Willkommen zur 'Transformation'!"

    puts "Du hast kein Bock mehr auf die Ungerechtigkeiten und Unsinnigkeiten, auf die Diskriminierung und Herrschaftsverhaeltnisse in der jetzigen Gesellschaft. Du beschliesst mitzumachen, bei der Transformation in eine moeglichst herrschaftsfreie Gesellschaft, die die Grenzen ueberwinden und mindestens drei Generationen andauern soll.\n\n"

    @current_step_id = nil
  end

  def start
    enter_next_step
  end

  private
    def enter_next_step 
      @current_step_id = @current_step_id == nil ? 0 : @current_step_id + 1
      @current_step = @@steps[@current_step_id]
      @state = State.new(@current_step.start)
      puts "#{@current_step.description}\n\n"
      game_loop
    end

    def print_possible_actions
      @@actions.each_with_index do |action, index|
        puts "#{index}: #{action.print}"
      end
    end

    def decide_on_action
      print "Weiter! moegliche Aktionen:\n"
      print_possible_actions
      puts "was willst du tun? waehle die Zahl"
      input = gets.chomp
      index = 0
      begin
        index = Integer(input)
      rescue
        puts "Du hast keine Zahl eingegeben"
        return 
      end
      if index > @@actions.length - 1
        puts "du hast keine gueltige Zahl eingegeben" 
        return
      end
      @@actions[index]
    end

    def game_loop
      puts "#{@state.print}\n\n"

      action = decide_on_action
      game_loop unless action
      puts "fuehre Aktion '#{action.description}' aus"

      @state.update(action.costs)
      @state.update(action.effects)
      return if not @state.check_wellbeing()
      if @state.check_goal(@current_step)
        enter_next_step
      else
        game_loop
      end
    end

end
