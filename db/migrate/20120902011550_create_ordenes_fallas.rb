class CreateOrdenesFallas < ActiveRecord::Migration
  def change
    create_table :ordenes_fallas do |t|
      t.references :orden_servicio
      t.references :falla

      t.timestamps
    end
    add_index :ordenes_fallas, :orden_servicio_id
    add_index :ordenes_fallas, :falla_id
  end
end
