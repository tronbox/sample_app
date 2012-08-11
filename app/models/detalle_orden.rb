class DetalleOrden < ActiveRecord::Base
  belongs_to :orden_servicio
  belongs_to :articulo
  attr_accessible :cantidad, :descripcion, :articulo_id

  validates_uniqueness_of :orden_servicio_id, :scope => :articulo_id

end
