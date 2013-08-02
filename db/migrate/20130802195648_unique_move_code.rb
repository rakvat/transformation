class UniqueMoveCode < ActiveRecord::Migration
  def change
    add_index(:moves, :code, {unique: true})
  end
end
