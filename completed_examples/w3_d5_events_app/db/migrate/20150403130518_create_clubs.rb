class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name
      t.text :image
      t.text :description
      t.references :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
