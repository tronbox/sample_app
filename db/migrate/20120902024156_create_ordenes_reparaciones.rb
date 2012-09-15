class CreateOrdenesReparaciones < ActiveRecord::Migration
  def change
    create_table :ordenes_reparaciones do |t|
      t.references :orden_servicio
      t.references :reparacion
      t.integer    :status

      t.timestamps
    end
    add_index :ordenes_reparaciones, :orden_servicio_id
    add_index :ordenes_reparaciones, :reparacion_id
  end
end
