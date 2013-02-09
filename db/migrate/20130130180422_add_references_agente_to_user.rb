class AddReferencesAgenteToUser < ActiveRecord::Migration
  def up
    change_table :useres do |t|
      t.references :agente
    end
    add_index :useres, :agente_id
  end

  def down
    remove_column :useres, :agente
    remove_index :useres, :agente_id
  end
end
