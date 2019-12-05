class CreatePosts < ActiveRecord::Migration[4.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text :body
      t.string :image_url
      t.belongs_to :user
      t.belongs_to :category

      t.timestamps null: false
    end
  end
end
