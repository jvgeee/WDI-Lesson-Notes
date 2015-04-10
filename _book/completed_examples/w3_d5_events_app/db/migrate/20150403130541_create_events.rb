class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :image
      t.text :description
      t.references :club, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
