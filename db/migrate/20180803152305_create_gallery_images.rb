class CreateGalleryImages < ActiveRecord::Migration[4.2]
  def change
    create_table :gallery_images do |t|
      t.string :image
      t.string :caption
      t.belongs_to :gallery

      t.timestamps null: false
    end
  end
end
