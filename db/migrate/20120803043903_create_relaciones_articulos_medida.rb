class CreateRelacionesArticulosMedida < ActiveRecord::Migration
  def change
    create_table :relaciones_articulos_medida do |t|
      t.references :articulo
      t.references :medida
      t.integer :unidades_por_empaque

      t.timestamps
    end
    add_index :relaciones_articulos_medida, :articulo_id
    add_index :relaciones_articulos_medida, :medida_id
  end
end
