class Effect 
  FACTORS = ['spread', 'establ', 'build', 'happy', 'time', 'transformers']
  def initialize(config)
    @diff = {}
    FACTORS.each do |key|
      @diff[key] = (config && config.include?(key)) ? config[key] : 0
    end
  end

  def to_s
    s = []
    @diff.each do |k,v|
      s << "#{k[0]}#{k[1]}: #{v}"
    end
    s.join(", ")
  end

  def get(key)
    return 0 unless @diff.include?(key)
    @diff[key]
  end
end


class Action

  attr_reader :effect, :description

  def initialize(config)
    @effect = Effect.new(config['effect'])
    @description = config['description']
  end

  def to_s
    "effect: #{@effect}"
  end

  def print
    if DEBUG
      to_s
    else
      @description
    end
  end
end
