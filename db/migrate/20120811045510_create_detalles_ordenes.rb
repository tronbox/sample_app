class CreateDetallesOrdenes < ActiveRecord::Migration
  def change
    create_table :detalles_ordenes do |t|
      t.references :orden_servicio
      t.references :articulo
      t.integer :cantidad
      t.string :descripcion

      t.timestamps
    end
    add_index :detalles_ordenes, :orden_servicio_id
    add_index :detalles_ordenes, :articulo_id
  end
end
