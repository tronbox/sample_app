class RemoveReferencesUserToAgente < ActiveRecord::Migration
  def up
    remove_index :agentes, :user_id
    remove_column :agentes, :user_id
  end

  def down
    remove_index :agentes, :user_id
    remove_column :agentes, :user_id
  end
end
