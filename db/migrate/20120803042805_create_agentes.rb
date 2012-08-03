class CreateAgentes < ActiveRecord::Migration
  def change
    create_table :agentes do |t|
      t.string :clave
      t.string :nombre

      t.timestamps
    end
    add_index :agentes, :clave, :unique => true
  end
end
