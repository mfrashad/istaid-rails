class CreateGalleries < ActiveRecord::Migration[4.2]
  def change
    create_table :galleries do |t|
      t.string :title
      t.string :description

      t.timestamps null: false
    end
  end
end
