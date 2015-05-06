class AddImageIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :image_id, :integer
    add_column :images, :category_id , :integer
  end
end
