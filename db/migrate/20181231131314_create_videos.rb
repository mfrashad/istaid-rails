class CreateVideos < ActiveRecord::Migration[4.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :body
      t.string :thumbnail
      t.integer :user_id
      t.string :youtube_id
      t.string :youtube_url
      t.timestamps null: false
    end
  end
end
