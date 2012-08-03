class AddIndexToSeriesNombre < ActiveRecord::Migration
  def change
    add_index :series, :nombre, unique: true
  end
end
