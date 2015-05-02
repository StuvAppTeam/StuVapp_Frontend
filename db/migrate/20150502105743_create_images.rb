class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :titel
      t.integer :offer_blackboard_id
      t.integer :campus_id
      t.string :photo
      t.integer :offer_apartment_id

      t.timestamps null: false
    end
  end
end
