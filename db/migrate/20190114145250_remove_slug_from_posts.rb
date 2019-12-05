class RemoveSlugFromPosts < ActiveRecord::Migration[4.0]
  def change
    remove_column :posts, :slug, :string
  end
end
