class Nave < ActiveRecord::Base
  has_many :reparacion
  has_many :agente

  attr_accessible :clave, :nombre
end
