class AddPhoneToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :phone, :string
  end
end
