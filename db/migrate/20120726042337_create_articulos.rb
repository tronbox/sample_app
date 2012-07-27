class CreateArticulos < ActiveRecord::Migration
  def change
    create_table :articulos do |t|
      t.string :clave
      t.string :descripcion
      t.string :descripcion_larga

      t.timestamps
    end
    add_index :articulos, :clave, :unique => true
  end
end
