class CreateOrdenesRefacciones < ActiveRecord::Migration
  def change
    create_table :ordenes_refacciones do |t|
      t.references :relacion_articulo_medida
      t.references :orden_servicio
      t.integer :cantidad
      t.text :descripcion

      t.timestamps
    end
    add_index :ordenes_refacciones, :relacion_articulo_medida_id
    add_index :ordenes_refacciones, :orden_servicio_id
  end
end
