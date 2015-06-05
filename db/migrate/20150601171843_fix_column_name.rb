class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :apartments, :smoking, :smoking
  end
end
