class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :url
      t.text :description
      t.integer :hits

      t.timestamps null: false
    end
  end
end
