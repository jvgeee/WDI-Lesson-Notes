class AddImageToCity < ActiveRecord::Migration
  def change
    add_column :cities, :image, :text
  end
end
