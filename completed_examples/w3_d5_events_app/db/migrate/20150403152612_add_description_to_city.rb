class AddDescriptionToCity < ActiveRecord::Migration
  def change
    add_column :cities, :description, :text
  end
end
