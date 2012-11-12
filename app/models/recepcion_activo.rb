class RecepcionActivo < ActiveRecord::Base
  belongs_to :agente
  belongs_to :vehiculo
  attr_accessible :descripcion, :fecha_recepcion, :agente_id, :vehiculo_id
end