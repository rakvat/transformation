class StepDropReferenceColumns < ActiveRecord::Migration
  def change
    remove_column :steps, :start_state
    remove_column :steps, :goal_state
  end
end
