class CreatePics < ActiveRecord::Migration
  def change
    create_table :pics do |t|
      t.integer :gallery_id

      t.timestamps null: false
    end
  end
end
