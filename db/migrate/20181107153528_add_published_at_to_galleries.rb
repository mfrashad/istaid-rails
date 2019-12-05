class AddPublishedAtToGalleries < ActiveRecord::Migration[4.2]
  def change
    add_column :galleries, :published_at, :datetime
  end
end
