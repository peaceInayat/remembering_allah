class AddRankToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :rank, :integer
  end
end
