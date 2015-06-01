class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :images, :offer_apartment_id, :apartment_id
    rename_column :apartments, :somking, :smoking
  end
end
