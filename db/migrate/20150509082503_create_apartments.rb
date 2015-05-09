class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :title
      t.string :description
      t.float :totalPrize
      t.string :street
      t.string :city
      t.string :zipcode
      t.integer :user_id
      t.float :size
      t.float :rent
      t.float :additionalCost
      t.string :phase
      t.float :deposit
      t.string :type
      t.datetime :movein
      t.boolean :furnished
      t.boolean :internet
      t.string :parking
      t.integer :rooms
      t.boolean :somking
      t.boolean :request

      t.timestamps null: false
    end
  end
end
