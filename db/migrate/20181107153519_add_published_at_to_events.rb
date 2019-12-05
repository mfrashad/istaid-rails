class AddPublishedAtToEvents < ActiveRecord::Migration[4.0]
  def change
    add_column :events, :published_at, :datetime
  end
end
