class OrdenServicio < ActiveRecord::Base
  belongs_to :area
  belongs_to :agente
  belongs_to :activo
  belongs_to :falla
  belongs_to :series
  belongs_to :estado
  has_many :detalle_orden
  has_many :articulo, :through => :detalle_orden, :dependent => :destroy

  accepts_nested_attributes_for :detalle_orden, :allow_destroy => true
  attr_accessible :descripcion, :fecha_entrega, :fecha_recepcion, :folio, :area_id, :agente_id, :activo_id, :falla_id, :series_id, 
    :estado_id, :detalle_orden_attributes, :articulo_id

  #validates_uniqueness_of :orden_servicio_id, :scope => :articulo_id
  
  def activo_descripcion
    if self.activo != nil
      self.activo.descripcion
    end
  end
end
