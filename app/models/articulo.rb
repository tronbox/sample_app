class Articulo < ActiveRecord::Base
  validates :clave, :presence => true, :length => {:maximum => 20, :minimum => 3}, :uniqueness => { :message => "La clave ya existe!"  }
  has_many :relaciones_articulos_medida
  has_many :medidas, :through => :relaciones_articulos_medida
  attr_accessible :clave, :descripcion, :descripcion_larga
end
