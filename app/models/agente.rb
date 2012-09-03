class Agente < ActiveRecord::Base
  belongs_to :nave
  validates :clave, :presence => true, :length => {:maximum => 20, :minimum => 3}, :uniqueness => { :message => "La clave ya existe!"  }
  attr_accessible :clave, :nombre, :e_mail, :responsable, :nave_id
end
