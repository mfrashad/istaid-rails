class AddThumbnailToPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :thumbnail, :string
  end
end
