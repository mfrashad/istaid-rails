class AddSummaryToPosts < ActiveRecord::Migration[4.0]
  def change
    add_column :posts, :summary, :string
  end
end
