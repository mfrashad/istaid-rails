class AddPublishedAtToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :published_at, :datetime
  end
end
