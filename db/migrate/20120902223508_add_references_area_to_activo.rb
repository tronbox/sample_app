class AddReferencesAreaToActivo < ActiveRecord::Migration
  def up
    change_table :activos do |t|
      t.references :area
    end
    add_index :activos, :area_id
  end

  def down
    remove_column :activos, :area
    remove_index :activos, :area_id
  end
end
