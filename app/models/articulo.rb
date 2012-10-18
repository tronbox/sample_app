class Articulo < ActiveRecord::Base
  validates :clave, :presence => true, :length => {:maximum => 20, :minimum => 3}, :uniqueness => { :message => "La clave ya existe!"  }  
  has_many :relacion_articulo_medida
  has_many :medidas, :through => :relacion_articulo_medida, :dependent => :destroy

  has_many :detalle_orden
  has_many :orden_servicio, :through => :detalle_orden
  
  #validates_associated :relacion_articulo_medida
  
  accepts_nested_attributes_for :relacion_articulo_medida, :allow_destroy => true
  attr_accessible :clave, :descripcion, :descripcion_larga, :articulo_id, :relacion_articulo_medida_attributes
  
  before_destroy :valida_dependencias
    
  protected
  def valida_dependencias    
    cuantos = RelacionArticuloMedida.where("articulo_id" => self.id)    
    if cuantos.count>0     
      return false            
    end
  end
end
