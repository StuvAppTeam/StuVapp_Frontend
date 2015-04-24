class CreateMensas < ActiveRecord::Migration
  def change
    create_table :mensas do |t|
      t.String :timestamp
      t.String :category
      t.String :title
      t.String :price

      t.timestamps null: false
    end
  end
end
