class AddSortToEmployees < ActiveRecord::Migration[4.2]
  def change
    add_column :employees, :sort, :integer
  end
end
