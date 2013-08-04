class StateJoinTable < ActiveRecord::Migration
  def change
    create_table :state_joins do |t|
      t.references :stateable, polymorphic: true
      t.references :state
      t.timestamps
    end
  end
end
