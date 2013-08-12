class User < ActiveRecord::Base
  has_one :user_step
  has_one :current_step, through: :user_step, source: :step

  has_one :current_state, class_name: State
end
