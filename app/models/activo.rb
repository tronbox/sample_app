class Activo < ActiveRecord::Base
  validates :clave, :presence => true, :length => {:maximum => 20, :minimum => 3}, :uniqueness => { :message => "La clave ya existe!"  } 
  attr_accessible :clave, :costo_revision, :descripcion
end
