class AddNameToStaticPages < ActiveRecord::Migration[4.2]
  def change
    add_column :static_pages, :name, :string
  end
end
