class CreateMensas < ActiveRecord::Migration
  def change
    create_table :mensas do |t|
      t.string :timestamp
      t.string :category
      t.string :title
      t.string :price

      t.timestamps null: false
    end
  end
end
