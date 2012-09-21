class OrdenReparacion < ActiveRecord::Base
  belongs_to :orden_servicio
  belongs_to :reparacion
  attr_accessible :reparacion_id, :status, :agente_id, :descripcion, :cancelada, :fecha_on, :fecha_off

  before_save :asigna_status

  def asigna_status
    self.status = Status::CAPTURADA if self.new_record?
  end

  def self.actualiza_estatus id_orden_servicio, id_nave, status
    ordenes = OrdenReparacion.joins(:orden_servicio, :reparacion => :nave).where("ordenes_servicios.id" => id_orden_servicio, "naves.id" => id_nave).readonly(false)

    ordenes.each do |orden|
      orden.status = status
      orden.save!
    end

    orden_servicio = OrdenServicio.find(id_orden_servicio)
    orden_servicio.status = status
    orden_servicio.save!

  end

end
