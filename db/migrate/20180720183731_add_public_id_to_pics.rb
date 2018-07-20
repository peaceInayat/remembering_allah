class AddPublicIdToPics < ActiveRecord::Migration
  def change
    add_column :pics, :public_id, :string
  end
end
