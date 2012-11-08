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

  has_many :orden_refaccion
  has_many :relacion_articulo_medida, :through => :orden_refaccion, :dependent => :destroy
  
  has_many :orden_imagen, :dependent => :destroy

  accepts_nested_attributes_for :orden_falla, :allow_destroy => true
  accepts_nested_attributes_for :orden_reparacion, :allow_destroy => true
  accepts_nested_attributes_for :orden_refaccion, :allow_destroy => true
  accepts_nested_attributes_for :orden_imagen, :allow_destroy => true

  attr_accessible :descripcion, :fecha_entrega, :fecha_recepcion, :folio, :activo_id, :series_id, :status, :orden_falla_attributes, :orden_reparacion_attributes, :orden_refaccion_attributes, :orden_imagen_attributes

  validates :fecha_recepcion, :fecha_entrega, :activo_id, :series_id, :presence => true
  validates_associated :orden_falla
  validates_associated :orden_reparacion
  
  before_save :asigna_folio

  def activo_descripcion
    if self.activo != nil
      self.activo.descripcion
    end
  end

  def asigna_folio
    if self.new_record?
      ultimo = OrdenServicio.where(:series_id => self.series).last
      if ultimo
        self.folio = ultimo.folio + 1
      else
        self.folio = 1
      end
    end

    self.status = Status::CAPTURADA if self.new_record?
  end

  def self.get_orden_servicio_for_user user
    ordenes_servicios = OrdenServicio.all
    #if user.responsable_nave?
    #  ordenes_servicios = OrdenServicio.where()
    #else

    #end
    ordenes_servicios
  end

end
