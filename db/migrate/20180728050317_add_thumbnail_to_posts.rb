class AddThumbnailToPosts < ActiveRecord::Migration[4.0]
  def change
    add_column :posts, :thumbnail, :string
  end
end
