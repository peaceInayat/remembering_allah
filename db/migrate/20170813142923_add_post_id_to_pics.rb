class AddPostIdToPics < ActiveRecord::Migration
  def change
    add_column :pics, :post_id, :integer
  end
end
