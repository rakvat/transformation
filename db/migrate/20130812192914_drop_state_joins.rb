class DropStateJoins < ActiveRecord::Migration
  def change
    drop_table :state_joins
  end
end
