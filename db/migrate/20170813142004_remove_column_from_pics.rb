class RemoveColumnFromPics < ActiveRecord::Migration
  def change
    remove_column :pics, :wisdom_id, :integer
  end
end
