class RemoveFieldsToOrdenesServicio < ActiveRecord::Migration
  def up
    remove_column :ordenes_servicios, :area
    remove_column :ordenes_servicios, :agente
    remove_column :ordenes_servicios, :falla
    remove_column :ordenes_servicios, :estado
    
    remove_index :ordenes_servicios, :area_id
    remove_index :ordenes_servicios, :agente_id
    remove_index :ordenes_servicios, :falla_id
    remove_index :ordenes_servicios, :estado_id

    add_column :ordenes_servicios, :status, :integer
  end

  def down
    add_column :ordenes_servicios, :area
    add_column :ordenes_servicios, :agente
    add_column :ordenes_servicios, :falla
    add_column :ordenes_servicios, :estado
    
    add_index :ordenes_servicios, :area_id
    add_index :ordenes_servicios, :agente_id
    add_index :ordenes_servicios, :falla_id
    add_index :ordenes_servicios, :estado_id

    remove_column :ordenes_servicios, :status, :integer
  end
end
