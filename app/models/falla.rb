class Falla < ActiveRecord::Base
  has_many :orden_falla
  has_many :orden_servicio, :through => :orden_falla

  validates :clave, :presence => true, :length => {:maximum => 20, :minimum => 3}, :uniqueness => { :message => "La clave ya existe!"  }
  attr_accessible :clave, :descripcion, :falla_id
end
