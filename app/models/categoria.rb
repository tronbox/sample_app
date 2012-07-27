class Categoria < ActiveRecord::Base
  attr_accessible :clave, :descripcion
  validates :clave, :presence => true, :length => {:maximum => 20, :minimum => 3}, :uniqueness => { :message => "La clave ya existe!"  }
end
