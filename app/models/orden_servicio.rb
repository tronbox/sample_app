class OrdenServicio < ActiveRecord::Base
  belongs_to :area
  belongs_to :agente
  belongs_to :activo
  belongs_to :falla
  belongs_to :series
  belongs_to :estado
  attr_accessible :descripcion, :fecha_entrega, :fecha_recepcion, :folio, :area_id, :agente_id, :activo_id, :falla_id, :series_id, 
    :estado_id
end
