class Articulo < ActiveRecord::Base
  validates :clave, :presence => true, :length => {:maximum => 20, :minimum => 3}, :uniqueness => { :message => "La clave ya existe!"  }
  has_many :relaciones_articulos_medida
  has_many :medidas, :through => :relaciones_articulos_medida

  has_many :detalle_orden
  has_many :orden_servicio, :through => :detalle_orden
  attr_accessible :clave, :descripcion, :descripcion_larga, :articulo_id
end
