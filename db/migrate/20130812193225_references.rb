class References < ActiveRecord::Migration
  def change
    change_table :states do |t|
      t.references :user
      t.references :step_start
      t.references :step_goal
    end
  end
end
