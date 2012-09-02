class OrdenServicio < ActiveRecord::Base
  #belongs_to :area #quitar
  #belongs_to :agente #quitar
  belongs_to :activo 
  #belongs_to :falla #quitar y ponr has_many
  belongs_to :series
  #belongs_to :estado
  
  has_many :orden_falla
  has_many :falla, :through => :orden_falla, :dependent => :destroy

  has_many :orden_reparacion
  has_many :reparacion, :through => :orden_reparacion, :dependent => :destroy


  accepts_nested_attributes_for :orden_falla, :allow_destroy => true
  accepts_nested_attributes_for :orden_reparacion, :allow_destroy => true

  attr_accessible :descripcion, :fecha_entrega, :fecha_recepcion, :folio, :activo_id, :falla_id, :series_id, :status, :orden_falla_attributes, :orden_reparacion_attributes, :reparacion_id

  validates :fecha_recepcion, :fecha_entrega, :area_id, :agente_id, :activo_id, :series_id, :estado_id, :presence => true
  validates_associated :orden_falla
  validates_associated :orden_reparacion
  

  def activo_descripcion
    if self.activo != nil
      self.activo.descripcion
    end
  end
end
