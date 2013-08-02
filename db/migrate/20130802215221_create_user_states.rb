class CreateUserStates < ActiveRecord::Migration
  def change
    create_table :user_states do |t|
      t.string :user_id
      t.string :state_id

      t.timestamps
    end
  end
end
