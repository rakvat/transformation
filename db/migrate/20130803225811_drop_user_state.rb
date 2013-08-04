class DropUserState < ActiveRecord::Migration
  def change
    drop_table :user_states
  end
end
