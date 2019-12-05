class AddPublishedAtToGalleries < ActiveRecord::Migration[4.0]
  def change
    add_column :galleries, :published_at, :datetime
  end
end
