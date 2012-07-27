class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.string :clave
      t.string :descripcion
      t.string :color_estado

      t.timestamps
    end
    add_index :estados, :clave, :unique => true
  end
end
