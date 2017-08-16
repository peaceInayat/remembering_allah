class AddRankToTestimonials < ActiveRecord::Migration
  def change
    add_column :testimonials, :rank, :integer
  end
end
