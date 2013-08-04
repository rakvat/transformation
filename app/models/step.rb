class Step < ActiveRecord::Base
  has_many :user_steps
  has_many :users, through: :user_steps

  has_one :start_state_join, class_name: StateJoin, as: :stateable
  has_one :goal_state_join, class_name: StateJoin, as: :stateable
  has_one :start_state, class_name: State, through: :start_state_join
  has_one :goal_state, class_name: State, through: :goal_state_join#, source: :stateable, source_type: StateJoin
end
