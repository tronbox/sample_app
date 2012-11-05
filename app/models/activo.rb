class Activo < ActiveRecord::Base
  belongs_to :area

  validates :clave, :presence => true, :length => {:maximum => 20, :minimum => 3}, :uniqueness => { :message => "La clave ya existe!"  } 
  attr_accessible :clave, :costo_revision, :descripcion, :area_id, :codigo, :imagen
  has_attached_file :imagen, :styles => { :small => "150x150>" },  
  :url => "/system/:attachment/:id/:style/:basename.:extension",  
  :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension"  
  validates_attachment_presence :imagen  
  validates_attachment_size :imagen, :less_than => 5.megabytes  
  validates_attachment_content_type :imagen, :content_type => ['image/jpeg', 'image/png'], :message => "Formato de imagen No aceptado, permitidos (.jpeg, .png)"
  

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
