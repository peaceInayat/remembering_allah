class AddNameToMiscs < ActiveRecord::Migration
  def change
    add_column :miscs, :name, :string
  end
end
