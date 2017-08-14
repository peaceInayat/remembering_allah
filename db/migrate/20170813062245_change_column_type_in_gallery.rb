class ChangeColumnTypeInGallery < ActiveRecord::Migration
  def change
    change_column :galleries, :body, :text
  end
end

