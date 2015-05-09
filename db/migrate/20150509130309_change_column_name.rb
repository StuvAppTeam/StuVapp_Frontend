class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :images, :offer_apartment_id, :apartment_id
  end
end
