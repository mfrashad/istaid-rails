class AddSlugToStaticPages < ActiveRecord::Migration[4.0]
  def change
    add_column :static_pages, :slug, :string
  end
end
