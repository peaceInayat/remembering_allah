class AddRankToWisdoms < ActiveRecord::Migration
  def change
    add_column :wisdoms, :rank, :integer
  end
end
