class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :code
      t.string :description
      t.string :start_state
      t.string :goal_state

      t.timestamps
    end
  end
end
