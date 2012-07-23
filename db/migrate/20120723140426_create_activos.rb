class CreateActivos < ActiveRecord::Migration
  def change
    create_table :activos do |t|
      t.string :clave
      t.string :descripcion
      t.double :costo_revision

      t.timestamps
    end
    add_index :activos, :clave, :unique => true
  end
end
