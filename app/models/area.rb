class Area < ActiveRecord::Base
  validates :clave, :presence => true, :length => {:maximum => 20, :minimum => 3}, :uniqueness => { :message => "La clave ya existe!"  }
  attr_accessible :calle, :clave, :codigo_postal, :colonia, :correo_electronico, :descripcion, :localidad, :municipio, :numero_exterior, :numero_interior, :telefono, :responsable
  before_destroy :valida_dependencias
    
  protected
  def valida_dependencias    
    cuantos = Activo.where("area_id" => self.id)    
    if cuantos.count>0     
      return false            
    end
  end
end
