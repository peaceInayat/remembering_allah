class AddPublicIdToWisdoms < ActiveRecord::Migration
  def change
    add_column :wisdoms, :public_id, :string
  end
end
