class AddSlugToVideos < ActiveRecord::Migration[4.2]
  def change
    add_column :videos, :slug, :string
    add_index :videos, :slug, unique: true
  end
end
