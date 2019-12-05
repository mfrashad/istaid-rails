class CreateEmployees < ActiveRecord::Migration[4.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :position
      t.text :description

      t.timestamps null: false
    end
  end
end
