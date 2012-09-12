class AddCodigoAndImagenUrlToActivo < ActiveRecord::Migration  
  def up
    change_table :activos do |t|
      t.string :codigo
      t.string :imagen_url     
    end    
  end

  def down
    remove_column :activos, :codigo
    remove_column :activos, :imagen_url       
  end
end
