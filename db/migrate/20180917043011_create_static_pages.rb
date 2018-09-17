class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.text :body
    end
  end
end
