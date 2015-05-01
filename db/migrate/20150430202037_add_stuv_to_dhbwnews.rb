class AddStuvToDhbwnews < ActiveRecord::Migration
  def change
    add_column :dhbw_news, :stuv, :boolean
  end
end
