class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.integer :offer_blackboard_id
      t.integer :campus_id
      t.string :photo
      t.integer :apartment_id

      t.timestamps null: false
    end
  end
end
