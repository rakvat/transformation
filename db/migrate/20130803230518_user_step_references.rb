class UserStepReferences < ActiveRecord::Migration
  def change
    change_column :user_steps, :user_id, :integer
    change_column :user_steps, :step_id, :integer
  end
end
