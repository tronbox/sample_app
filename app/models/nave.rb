class Nave < ActiveRecord::Base
  has_many :reparacion

  attr_accessible :clave, :nombre
end
