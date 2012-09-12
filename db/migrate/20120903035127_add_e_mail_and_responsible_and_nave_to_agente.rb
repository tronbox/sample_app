class AddEMailAndResponsibleAndNaveToAgente < ActiveRecord::Migration
  def up
    change_table :agentes do |t|
      t.string :e_mail
      t.boolean :responsable
      t.references :nave
    end
    add_index :agentes, :nave_id
  end

  def down
    remove_column :agentes, :e_mail
    remove_column :agentes, :responsable
    remove_column :agentes, :nave
    remove_index  :agentes, :nave_id
  end
end
