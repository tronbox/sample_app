class Falla < ActiveRecord::Base
  has_many :orden_falla
  has_many :orden_servicio, :through => :orden_falla

  validates :clave, :presence => true, :length => {:maximum => 20, :minimum => 3}, :uniqueness => { :message => "La clave ya existe!"  }
  attr_accessible :clave, :descripcion, :falla_id
  before_destroy :valida_dependencias
  
  protected
  def valida_dependencias    
    cuantos = OrdenFalla.where("falla_id" => self.id)
    if cuantos.count>0
      return false            
    end
  end
end
