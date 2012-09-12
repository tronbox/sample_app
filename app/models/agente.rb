class Agente < ActiveRecord::Base
  belongs_to :nave
  validate :valida_responsable_for_nave
  validates :clave, :presence => true, :length => {:maximum => 20, :minimum => 3}, :uniqueness => { :message => "La clave ya existe!"  }
  attr_accessible :clave, :nombre, :e_mail, :responsable, :nave_id
  
  
    def valida_responsable_for_nave
      #if Agente.find_by_nave_id_and_responsable(5, TRUE)      
       # errors.add(:nave_id, "Ya existe en la BD")
      #end
      #puts "**********************************************************************************"
      #puts self.nave_id
      #puts Agente.find_by_nave_id_and_responsable(self.nave_id, TRUE)
      if self.responsable?
        errors.add(:nave_id, "Ya existe un Responsable para esta Nave Industrial") if Agente.find_by_nave_id_and_responsable(self.nave_id, TRUE)
      end
    end
end
