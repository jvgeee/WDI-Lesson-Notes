class CreatePhotosTags < ActiveRecord::Migration
  def change
    create_join_table(:photos, :tags)
  end
end
