class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :apartments, :somking, :smoking
  end
end
