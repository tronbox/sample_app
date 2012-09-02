class AddStepsAndNaveToReparacion < ActiveRecord::Migration
  def up
    change_table :reparaciones do |t|
      t.text :pasos
      t.references :nave
    end
    add_index :reparaciones, :nave_id
  end

  def down
    remove_column :reparaciones, :pasos
    remove_column :reparaciones, :nave
    remove_index  :reparaciones, :nave_id
  end
end
