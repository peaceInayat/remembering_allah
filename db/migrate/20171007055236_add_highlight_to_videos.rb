class AddHighlightToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :highlight, :boolean
  end
end
