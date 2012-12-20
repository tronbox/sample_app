class Agente < ActiveRecord::Base
  has_many :recepcion_activo
  belongs_to :nave
  belongs_to :user 
  #validate :valida_responsable_for_nave
  validates :clave, :presence => true, :length => {:maximum => 20, :minimum => 3}, :uniqueness => { :message => "La clave ya existe!"  }
  attr_accessible :clave, :nombre, :e_mail, :responsable, :nave_id,  :user_id
  
  before_create do |agente|   

    #if Agente.find_by_nave_id_and_responsable(5, TRUE)      
    # errors.add(:nave_id, "Ya existe en la BD")
    #end
    #puts "**********************************************************************************"
    #puts self.nave_id
    #puts Agente.find_by_nave_id_and_responsable(self.nave_id, TRUE)
    if agente.responsable?  
      errors.add(:nave_id, "Ya existe un Responsable para esta Nave Industrial") if Agente.find_by_nave_id_and_responsable(agente.nave_id, TRUE)
      return false
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
