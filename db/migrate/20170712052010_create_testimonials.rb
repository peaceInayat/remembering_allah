class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :body
      t.string :name
      t.string :profession

      t.timestamps null: false
    end
  end
end
