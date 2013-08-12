class Step < ActiveRecord::Base
  has_many :user_steps
  has_many :users, through: :user_steps

  has_one :start_state, class_name: State, foreign_key: "step_start_id"
  has_one :goal_state, class_name: State, foreign_key: "step_goal_id"
end
