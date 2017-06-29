class AddColumnsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :content_id, :integer
    add_column :comments, :content_type, :string
    remove_column :comments, :post_id, :integer
    remove_column :comments, :video_id, :integer
  end
end
