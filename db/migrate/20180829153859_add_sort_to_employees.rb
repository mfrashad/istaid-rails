class AddSortToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :sort, :integer
  end
end
