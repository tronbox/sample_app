class ConsultasController < ApplicationController
  load_and_authorize_resource
  
  def general
    query = "SELECT OS.* FROM ordenes_servicios OS  "
    
    if params[:opcion_nave] == "por_nave"
      query = query + "INNER JOIN ordenes_reparaciones ORR ON OS.id=ORR.orden_servicio_id "
      query = query + "INNER JOIN reparaciones R ON ORR.reparacion_id=R.id AND R.nave_id ="+ params[:id_nave]
    end
    
    if params[:opcion_area] == "por_area"      
      query = query + "INNER JOIN activos A ON OS.activo_id=A.id AND A.area_id ="+ params[:id_area]
    end
            
    if params[:fecha_inicial].present? && params[:fecha_final].present?
      query = query + " WHERE OS.fecha_recepcion BETWEEN ? AND ? ", params[:fecha_inicial], params[:fecha_final]    
    end
    
    
    
            
    if params[:format]       
      #@ordenes_servicios = OrdenServicio.where("fecha_recepcion BETWEEN ? AND ? ", params[:fecha_inicial], params[:fecha_final] )
      @ordenes_servicios = OrdenServicio.find_by_sql(query)
      respond_to do |format|
        format.xls {send_data @ordenes_servicios.to_xls, :filename => 'reporte.xls' }
        format.pdf do
          pdf = OrdenesServicioPdf.new(@ordenes_servicios, view_context)
          send_data pdf.render, filename: "orden_servicio.pdf",
                                type: "application/pdf",
                                disposition: "inline"
        end
      end
    else      
      @naves = Nave.all
      @areas = Area.all            
    end
  end
end
