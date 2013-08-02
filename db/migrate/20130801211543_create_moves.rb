class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :code
      t.string :desc
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
