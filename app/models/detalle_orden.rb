class DetalleOrden < ActiveRecord::Base
  belongs_to :orden_servicio
  belongs_to :articulo
  attr_accessible :cantidad, :descripcion, :articulo_id

  validates :cantidad, :presence => true, :numericality => { only_integer: true, :greater_than => 0 }

end
