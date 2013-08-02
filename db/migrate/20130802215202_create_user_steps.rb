class CreateUserSteps < ActiveRecord::Migration
  def change
    create_table :user_steps do |t|
      t.string :user_id
      t.string :step_id

      t.timestamps
    end
  end
end
