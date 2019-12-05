class AddSlugToPosts < ActiveRecord::Migration[4.0]
  def change
    add_column :posts, :slug, :string
    add_index :posts, :slug, unique: true
  end
end
