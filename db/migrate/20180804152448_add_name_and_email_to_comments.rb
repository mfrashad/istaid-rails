class AddNameAndEmailToComments < ActiveRecord::Migration[4.2]
  def change
    add_column :comments, :name, :string
    add_column :comments, :email, :string
  end
end
