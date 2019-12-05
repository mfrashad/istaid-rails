class AddCategoryIdToEvents < ActiveRecord::Migration[4.0]
  def change
    add_reference :events, :category, index: true
  end
end
