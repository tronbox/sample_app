class Activo < ActiveRecord::Base
  belongs_to :area

  validates :clave, :presence => true, :length => {:maximum => 20, :minimum => 3}, :uniqueness => { :message => "La clave ya existe!"  } 
  attr_accessible :clave, :costo_revision, :descripcion, :area_id, :codigo, :imagen_url

  before_destroy :valida_dependencias
  
  protected
  def valida_dependencias
    
    cuantos = OrdenServicio.where("activo_id" => self.id)
    if cuantos.count>0
      return false            
    end
  end
  #def activo_area
  #    self.area.descripcion
  #end
end
