class CreateOrdenesServicios < ActiveRecord::Migration
  def change
    create_table :ordenes_servicios do |t|
      t.integer :folio
      t.integer :status
      t.datetime :fecha_recepcion
      t.datetime :fecha_entrega
      t.text :descripcion
      #t.references :area
      #t.references :agente
      t.references :activo
      #t.references :falla
      t.references :series
      #t.references :estado

      t.timestamps
    end
    #add_index :ordenes_servicios, :area_id
    #add_index :ordenes_servicios, :agente_id
    add_index :ordenes_servicios, :activo_id
    #add_index :ordenes_servicios, :falla_id
    add_index :ordenes_servicios, :series_id
    #add_index :ordenes_servicios, :estado_id
  end
end
