class AddNameToStaticPages < ActiveRecord::Migration
  def change
    add_column :static_pages, :name, :string
  end
end
