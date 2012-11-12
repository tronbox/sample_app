class CreateRecepcionesActivos < ActiveRecord::Migration
  def change
    create_table :recepciones_activos do |t|
      t.references :agente
      t.references :vehiculo
      t.datetime :fecha_recepcion
      t.text :descripcion

      t.timestamps
    end
    add_index :recepciones_activos, :agente_id
    add_index :recepciones_activos, :vehiculo_id
  end
end
