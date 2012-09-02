class OrdenFalla < ActiveRecord::Base
  belongs_to :orden_servicio
  belongs_to :falla
  attr_accessible :falla_id
end
