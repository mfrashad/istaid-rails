class CreateCategories < ActiveRecord::Migration[4.0]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
