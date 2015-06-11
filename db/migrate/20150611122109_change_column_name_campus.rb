class ChangeColumnNameCampus < ActiveRecord::Migration
  def change
    rename_column :images, :campus_id, :campu_id
  end
end
