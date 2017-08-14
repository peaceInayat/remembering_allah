class RemovePostIdFromPics < ActiveRecord::Migration
  def change
    remove_column :pics, :post_id, :integer
  end
end
