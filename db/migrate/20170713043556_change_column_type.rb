class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column :testimonials, :body, :text
  end
end
