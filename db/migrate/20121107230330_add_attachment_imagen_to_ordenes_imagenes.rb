class AddAttachmentImagenToOrdenesImagenes < ActiveRecord::Migration
  def self.up
    change_table :ordenes_imagenes do |t|
      t.has_attached_file :imagen
    end
  end

  def self.down
    drop_attached_file :ordenes_imagenes, :imagen
  end
end
