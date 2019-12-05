class AddSortToEmployees < ActiveRecord::Migration[4.0]
  def change
    add_column :employees, :sort, :integer
  end
end
