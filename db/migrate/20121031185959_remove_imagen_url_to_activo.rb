class RemoveImagenUrlToActivo < ActiveRecord::Migration
  def up
    remove_column :activos, :imagen_url
  end

  def down
    remove_column :activos, :imagen_url
  end
end
