class Agente < ActiveRecord::Base
  has_many :recepcion_activo
  belongs_to :nave
  has_many :user
  #validate :valida_responsable_for_nave
  validates :clave, :presence => true, :length => {:maximum => 20, :minimum => 3}, :uniqueness => { :message => "La clave ya existe!"  }
  
  attr_accessible :clave, :nombre, :e_mail, :responsable, :nave_id
  
  
  before_create :valida_responsable_for_nave
  before_save :valida_responsable_for_update
  
  protected
  def valida_responsable_for_nave 

    #if Agente.find_by_nave_id_and_responsable(5, TRUE)      
    # errors.add(:nave_id, "Ya existe en la BD")
    #end
    #puts "**********************************************************************************"
    #puts self.nave_id
    #puts Agente.find_by_nave_id_and_responsable(self.nave_id, TRUE)
    if self.responsable?  
      errors.add(:nave_id, "Ya existe un Responsable para esta Nave Industrial") if Agente.find_by_nave_id_and_responsable(self.nave_id, TRUE)
      return false
    end
  end
  
  protected
  def valida_responsable_for_update
    if self.responsable?  
      if Agente.where("id <> ? AND nave_id = ? AND responsable = ?", self.id, self.nave_id, TRUE).count > 0                  
        errors.add(:nave_id, "Ya existe un Responsable para esta Nave Industrial") 
        return false
      end
    end
  end
  
    
  before_destroy :valida_dependencias
  
  protected
  def valida_dependencias    
    #cuantos = OrdenReparacion.where("agente_id" => self.id)
    #if cuantos.count>0
    if OrdenReparacion.where("agente_id" => self.id).count>0 or RecepcionActivo.where("agente_id" => self.id).count>0 
      return false                
    end            
  end
  
  
end
