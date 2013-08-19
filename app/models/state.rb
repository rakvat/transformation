class State < ActiveRecord::Base
  belongs_to :player
  belongs_to :step_start, class_name: Step
  belongs_to :step_goal, class_name: Step
  # todo: use only one of the foreign keys?
  # todo: move to separate table?

  PARAMETERS = ['spread', 'establ', 'build', 'happy', 'time', 'transformers']
 
  def update(move)
    PARAMETERS.each do |parameter|
      self[parameter] += move[parameter].to_i
    end
    self.save!
  end
end
