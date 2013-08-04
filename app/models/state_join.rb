class StateJoin < ActiveRecord::Base
  belongs_to :stateable , polymorphic: true
  belongs_to :state
end
