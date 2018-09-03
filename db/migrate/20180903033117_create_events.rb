class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :body
      t.string :summary
      t.string :thumbnail
      t.references :gallery, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
