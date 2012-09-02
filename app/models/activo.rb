class Activo < ActiveRecord::Base
  belongs_to :area

  validates :clave, :presence => true, :length => {:maximum => 20, :minimum => 3}, :uniqueness => { :message => "La clave ya existe!"  } 
  attr_accessible :clave, :costo_revision, :descripcion, :area_id

  #def activo_area
  #    self.area.descripcion
  #end
end
