class AddFieldRolToUser < ActiveRecord::Migration
  def up
    change_table :useres do |t|
      t.references :rol
    end
    add_index :useres, :rol_id
  end

  def down
    remove_column :useres, :rol
    remove_index :useres, :rol_id
  end
end
