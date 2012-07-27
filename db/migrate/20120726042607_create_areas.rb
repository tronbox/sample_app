class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :clave
      t.string :descripcion
      t.string :calle
      t.string :numero_exterior
      t.string :numero_interior
      t.string :colonia
      t.string :localidad
      t.string :municipio
      t.string :codigo_postal
      t.string :telefono
      t.string :correo_electronico

      t.timestamps
    end
    add_index :areas, :clave, :unique => true
  end
end
