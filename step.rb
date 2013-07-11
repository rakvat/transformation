class Step

  attr_reader :start, :goal, :description  

  def initialize(config)
    @start = config['start']
    @goal = config['goal']
    @description = config['description']
  end
end

