class AddModelTypeToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :model_type, :integer, default: 0, index: true
  end
end
