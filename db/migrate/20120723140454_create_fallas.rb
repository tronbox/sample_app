class CreateFallas < ActiveRecord::Migration
  def change
    create_table :fallas do |t|
      t.string :clave
      t.string :descripcion

      t.timestamps
    end
    add_index :fallas, :clave, :unique => true
  end
end
