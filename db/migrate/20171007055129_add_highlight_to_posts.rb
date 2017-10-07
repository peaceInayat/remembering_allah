class AddHighlightToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :highlight, :boolean
  end
end
