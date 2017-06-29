class RemoveColumnFromVideos < ActiveRecord::Migration
  def change
    remove_column :videos, :category, :string
    add_column :videos, :category, :integer
  end
end
