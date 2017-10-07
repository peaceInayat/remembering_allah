class AddHighlightToWisdoms < ActiveRecord::Migration
  def change
    add_column :wisdoms, :highlight, :boolean
  end
end
