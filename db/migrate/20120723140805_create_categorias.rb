class CreateCategorias < ActiveRecord::Migration
  def change
    create_table :categorias do |t|
      t.string :clave
      t.string :descripcion

      t.timestamps
    end
    add_index :categorias, :clave, :unique => true
  end
end
