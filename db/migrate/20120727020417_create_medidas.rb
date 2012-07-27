class CreateMedidas < ActiveRecord::Migration
  def change
    create_table :medidas do |t|
      t.string :clave
      t.string :descripcion

      t.timestamps
    end
    add_index :medidas, :clave, :unique => true
  end
end
