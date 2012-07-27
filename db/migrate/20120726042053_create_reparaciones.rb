class CreateReparaciones < ActiveRecord::Migration
  def change
    create_table :reparaciones do |t|
      t.string :clave
      t.string :descripcion

      t.timestamps
    end
    add_index :reparaciones, :clave, :unique => true
  end
end
