class ChangeApartmentType < ActiveRecord::Migration
  def change
    rename_column :apartments, :type, :apartment_type
  end
end
