class AddSummaryToPosts < ActiveRecord::Migration[4.2]
  def change
    add_column :posts, :summary, :string
  end
end
