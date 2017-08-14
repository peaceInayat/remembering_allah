class AddColumnToPics < ActiveRecord::Migration
  def change
    add_column :pics, :wisdom_id, :integer
  end
end
