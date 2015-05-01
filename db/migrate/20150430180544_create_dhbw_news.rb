class CreateDhbwNews < ActiveRecord::Migration
  def change
    create_table :dhbw_news do |t|
      t.string :feedId
      t.string :message
      t.string :picture
      t.string :link
      t.datetime :feedDate

      t.timestamps null: false
    end
  end
end
