class CreateCamps < ActiveRecord::Migration[5.2]
  def change
    create_table :camps do |t|
      t.string :name
      t.string :state
      t.text :description
      t.timestamps
    end
  end
end
