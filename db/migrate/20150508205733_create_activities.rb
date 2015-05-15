class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.string :description
      t.string :telephone
      t.string :email
      t.string :contactName
      t.string :type
      t.string :weekday
      t.string :street
      t.string :zipcode
      t.string :city
      t.string :locationName
      t.string :locationDescription
      t.string :longitude
      t.string :latitude

      t.timestamps null: false
    end
  end
end
