class Series < ActiveRecord::Base
  attr_accessible :nombre
  has_many :series

  validates :nombre, presence: true, uniqueness: { case_sensitive: false }
  
  before_destroy :valida_dependencias
  
  protected
  def valida_dependencias    
    cuantos = OrdenServicio.where("series_id" => self.id)
    if cuantos.count>0
      return false            
    end
  end

end
