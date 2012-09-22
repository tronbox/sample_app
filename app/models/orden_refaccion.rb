class OrdenRefaccion < ActiveRecord::Base
  belongs_to :relacion_articulo_medida 
  belongs_to :orden_servicio
  attr_accessible :relacion_articulo_medida_id, :cantidad, :descripcion
end
