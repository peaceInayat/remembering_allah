class RemoveColumnFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :type, :string
    add_column :categories, :section, :string
  end
end
