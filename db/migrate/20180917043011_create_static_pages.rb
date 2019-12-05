class CreateStaticPages < ActiveRecord::Migration[4.2]
  def change
    create_table :static_pages do |t|
      t.text :body
    end
  end
end
