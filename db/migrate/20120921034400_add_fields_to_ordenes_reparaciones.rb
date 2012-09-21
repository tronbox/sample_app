class AddFieldsToOrdenesReparaciones < ActiveRecord::Migration
  def up
    change_table :ordenes_reparaciones do |t|
      t.text :descripcion
      t.boolean :cancelada
      t.references :agente
      t.datetime :fecha_on
      t.datetime :fecha_off
    end
    add_index :ordenes_reparaciones, :agente_id
  end

  def down
    remove_column :ordenes_reparaciones, :descripcion
    remove_column :ordenes_reparaciones, :cancelada
    remove_column :ordenes_reparaciones, :fecha_on
    remove_column :ordenes_reparaciones, :fecha_off
    remove_column :ordenes_reparaciones, :agente
    remove_index  :ordenes_reparaciones, :agente_id
  end
end
