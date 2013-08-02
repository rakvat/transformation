class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.integer :spread
      t.integer :establ
      t.integer :build
      t.integer :happy
      t.integer :time
      t.integer :transformers

      t.timestamps
    end
  end
end
