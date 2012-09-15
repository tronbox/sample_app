class Nave < ActiveRecord::Base
  has_many :reparacion
  has_many :agente

  attr_accessible :clave, :nombre

  def self.obten_naves_sin_asignar_por_orden_de_servicio id_orden_servicio
    naves = Nave.joins(:reparacion => {:orden_reparacion => :orden_servicio}).where(:ordenes_servicios => {:id => id_orden_servicio}, :ordenes_reparaciones => {:status => Status::CAPTURADA}).select("distinct(naves.id), naves.nombre")
  end
end
