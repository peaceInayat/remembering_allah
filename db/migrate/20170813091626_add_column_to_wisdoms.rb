class AddColumnToWisdoms < ActiveRecord::Migration
  def change
    add_column :wisdoms, :short_description, :text
  end
end
