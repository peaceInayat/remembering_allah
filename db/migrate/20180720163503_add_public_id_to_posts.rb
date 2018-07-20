class AddPublicIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :public_id, :string
    add_column :core_articles, :public_id, :string
    add_column :publications, :public_id, :string
    add_column :testimonials, :public_id, :string
  end
end
