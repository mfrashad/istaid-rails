class AddPostIdToComments < ActiveRecord::Migration[4.2]
  def change
    add_column :comments, :post_id, :integer
  end
end
