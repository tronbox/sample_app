class Status
  REPARACION = {"CAPTURADA"=>0, "LIBERADA" => 2}
 
  CAPTURADA = 0 #Se creó por primera vez aplica para OS y reparación
  ASIGNADA = 1 #Se asigno a una nave aplica para OS y reparación
  LIBERADA = 2 #Se libero de una asignacion previa, aplica para la OS y reparacion
  FINALIZADA = 3 #Se liberaron todas las reparaciones, aplica solo para la OS

  def self.estatus(estado)
    case estado
    when 0
      "Capturada"
    when 1
      "Asignada"
    when 2
      "Liberada"
    end
  end
end
