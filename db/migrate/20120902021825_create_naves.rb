class CreateNaves < ActiveRecord::Migration
  def change
    create_table :naves do |t|
      t.string :clave
      t.string :nombre

      t.timestamps
    end
  end
end
