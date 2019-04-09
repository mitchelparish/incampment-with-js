class AddLatLngToCamps < ActiveRecord::Migration[5.2]
  def change
    add_column :camps, :lat, :decimal, :precision => 15, :scale => 10
    add_column :camps, :lng, :decimal, :precision => 15, :scale => 10
  end
end
