class AddGraffitiImageToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :graffiti_image, :text
  end
end
