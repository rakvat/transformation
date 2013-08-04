class User < ActiveRecord::Base
  has_one :user_step
  has_one :current_step, through: :user_step, class_name: Step 
  has_one :current_state, class_name: State, as: :stateable 
end
