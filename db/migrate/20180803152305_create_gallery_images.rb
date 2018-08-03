class CreateGalleryImages < ActiveRecord::Migration
  def change
    create_table :gallery_images do |t|
      t.string :image
      t.belongs_to :gallery

      t.timestamps null: false
    end
  end
end
