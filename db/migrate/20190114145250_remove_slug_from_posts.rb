class RemoveSlugFromPosts < ActiveRecord::Migration[4.2]
  def change
    remove_column :posts, :slug, :string
  end
end
