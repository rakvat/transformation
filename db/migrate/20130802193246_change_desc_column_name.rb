class ChangeDescColumnName < ActiveRecord::Migration
  def change
    rename_column :moves, :desc, :description
  end
end
