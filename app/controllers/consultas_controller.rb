class ConsultasController < ApplicationController
  authorize_resource :class => false
  
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
        #format.pdf do
          #pdf = OrdenesServicioPdf.new(@ordenes_servicios, view_context)
          #send_data pdf.render, filename: "orden_servicio.pdf",
          #                      type: "application/pdf",
          #                      disposition: "inline"
        #end
        format.pdf { reporte(@ordenes_servicios) }
      end
    else      
      @naves = Nave.all
      @areas = Area.all            
    end
  end
  
  def reporte(ordenes_servicios)
    data = []    
    ordenes_servicios.each do |os|                       
      cabecera = {:serie => os.series.nombre,
            :folio => os.folio,
            :fecha_recepcion => os.fecha_recepcion,
            :fecha_entrega => os.fecha_entrega,
            :nombre_activo => os.activo.descripcion,
            :descripcion => os.descripcion,
            :area => os.activo.area.descripcion,
            :imagen => valida_imagenes(os.activo.imagen_url),
            :codigo_barras => genera_codigo_de_barras(os.activo.codigo),            
            :detalle_fallas => [],
            :detalle_reparaciones => []
            }
            
      os.falla.map do |item|      
        cabecera[:detalle_fallas] << {:fallas => item.descripcion } 
      end
      
      os.reparacion.map do |item|      
        cabecera[:detalle_reparaciones] << {:reparaciones => item.descripcion } 
      end      
      data << cabecera         
    end
    
    report = ThinReports::Report.create do |r| 
             
      r.use_layout "#{Rails.root}/app/reports/ordenes_de_servicio.tlf"
      
      data.each do |header|
        r.start_new_page            
        r.page.values(:serie => header[:serie],
                    :folio   => header[:folio],
                    :fecha_recepcion    => header[:fecha_recepcion],
                    :fecha_entrega       => header[:fecha_entrega],
                    :nombre_activo       => header[:nombre_activo],
                    :descripcion         => header[:descripcion],
                    :area => header[:area],
                    :imagen         => header[:imagen],
                    :codigo_barras=> header[:codigo_barras])
                      
                              
        header[:detalle_fallas].each do |detalle|    
          r.page.list(:detalle_fallas).add_row(detalle)                            
        end
        
        header[:detalle_reparaciones].each do |detalle|    
          r.page.list(:detalle_reparaciones).add_row(detalle)                            
        end        
      end
    end                 


    send_data report.generate, filename: 'tasks.pdf', 
                               type: 'application/pdf', 
                               disposition: 'attachment'   
  end 
  
  def valida_imagenes(imagen)    
    if File.exist?("#{imagen}")      
      return imagen
    end
  end
  
  def genera_codigo_de_barras(codigo)
    doc=RGhost::Document.new :paper => [5,2]
    doc.barcode_code39("#{codigo}",:columns => 2, :rows=> 2, :text => {:size => 10})
    doc.render :jpeg, :filename => "#{Rails.root}/tmp/#{codigo}.jpeg"
    return "#{Rails.root}/tmp/#{codigo}.jpeg" if File.exist?("#{Rails.root}/tmp/#{codigo}.jpeg")      
  end   
end
