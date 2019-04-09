class CreateCampCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :camp_categories do |t|
      t.integer :category_id
      t.integer :camp_id 
      t.timestamps
    end
  end
end
