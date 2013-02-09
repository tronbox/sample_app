class AddReferencesUserToAgente < ActiveRecord::Migration
  def up
    change_table :agentes do |t|
      t.references :user
    end
    add_index :agentes, :user_id
  end

  def down
    remove_column :agentes, :user
    remove_index :agentes, :user_id
  end
end
