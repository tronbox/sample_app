class CreateVehiculos < ActiveRecord::Migration
  def change
    create_table :vehiculos do |t|
      t.string :numero_de_serie
      t.string :marca
      t.string :linea
      t.integer :modelo
      t.string :procedencia
      t.integer :cilindros
      t.string :numero_de_motor
      t.string :clase
      t.string :tipo
      t.integer :clave_vehicular
      t.string :capacidad
      t.string :combustible
      t.integer :numero_de_puertas

      t.timestamps
    end
    add_index :vehiculos, :numero_de_serie, :unique => true
    add_index :vehiculos, :numero_de_motor, :unique => true
  end
end
