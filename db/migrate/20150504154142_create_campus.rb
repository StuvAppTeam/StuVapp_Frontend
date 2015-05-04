class CreateCampus < ActiveRecord::Migration
  def change
    create_table :campus do |t|
      t.string :street
      t.string :zipcode
      t.string :city
      t.string :name
      t.string :description
      t.string :longitude
      t.string :latitude

      t.timestamps null: false
    end
  end
end
