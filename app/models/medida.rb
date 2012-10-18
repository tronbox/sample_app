class Medida < ActiveRecord::Base
  validates :clave, :presence => true, :length => {:maximum => 20, :minimum => 3}, :uniqueness => { :message => "La clave ya existe!"  }
  has_many :relacion_articulo_medida
  has_many :articulos, :through => :relacion_articulo_medida
  
  attr_accessible :clave, :descripcion
  before_destroy :valida_dependencias
  
  protected
  def valida_dependencias    
    cuantos = RelacionArticuloMedida.where("medida_id" => self.id)
    if cuantos.count>0
      return false            
    end
  end
end
