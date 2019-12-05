class AddImageToEmployees < ActiveRecord::Migration[4.0]
  def change
    add_column :employees, :image, :string
  end
end
