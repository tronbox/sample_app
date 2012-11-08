class CreateOrdenesImagenes < ActiveRecord::Migration
  def change
    create_table :ordenes_imagenes do |t|
      t.references :orden_servicio

      t.timestamps
    end
    add_index :ordenes_imagenes, :orden_servicio_id
  end
end
