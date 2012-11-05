class AddAttachmentImagenToActivos < ActiveRecord::Migration
  def self.up
    change_table :activos do |t|
      t.has_attached_file :imagen
    end
  end

  def self.down
    drop_attached_file :activos, :imagen
  end
end
