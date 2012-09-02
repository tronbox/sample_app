class Reparacion < ActiveRecord::Base
  belongs_to :nave

  has_many :orden_reparacion
  has_many :orden_servicio, :through => :orden_reparacion


  validates :clave, :presence => true, :length => {:maximum => 20, :minimum => 3}, :uniqueness => { :message => "La clave ya existe!"  }
  attr_accessible :clave, :descripcion, :pasos, :nave_id, :reparacion_id
end
