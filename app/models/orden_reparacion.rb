class OrdenReparacion < ActiveRecord::Base
  belongs_to :orden_servicio
  belongs_to :reparacion
  attr_accessible :reparacion_id
end
