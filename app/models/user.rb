class User < ActiveRecord::Base
  has_one :user_step
  has_one :current_step, through: :user_step, source: :step

  has_one :current_state, class_name: State

  def setup_game
    unless self.current_step
      self.current_step = Step.find_by_sql(['SELECT * FROM steps WHERE code = ? ', Step::START_STEP]).first
      self.current_step.save!
    end
    unless self.current_state
      dup = self.current_step.start_state.dup
      dup.step_start_id = nil
      dup.save!
      self.current_state = dup
    end
  end
end
