class OrdenesServiciosController < ApplicationController
  load_and_authorize_resource

  # GET /ordenes_servicios
  # GET /ordenes_servicios.json
  load_and_authorize_resource
  def index
    @ordenes_servicios = OrdenServicio.get_orden_servicio_for_user current_user

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ordenes_servicios }
      #format.pdf do
      #  pdf = OrdenesServicioPdf.new(@ordenes_servicios, view_context)
      #  send_data pdf.render, filename: "orden_servicio.pdf",
      #                        type: "application/pdf",
      #                        disposition: "inline"
      #end 
      format.pdf { reporte_ordenes_de_servicio(@ordenes_servicios) }          
    end
  end

  # GET /ordenes_servicios/1
  # GET /ordenes_servicios/1.json
  def show
    @orden_servicio = OrdenServicio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @orden_servicio }
      #format.pdf do
      #  pdf = OrdenServicioPdf.new(@orden_servicio, view_context)
      #  send_data pdf.render, filename: "orden_servicio.pdf",
      #                        type: "application/pdf",
      #                        disposition: "inline"
      #end
      format.pdf { reporte_orden_de_servicio(@orden_servicio) }
    end
  end

  # GET /ordenes_servicios/new
  # GET /ordenes_servicios/new.json
  def new
    @orden_servicio = OrdenServicio.new
    @activos = Activo.all
    @activo = Activo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @orden_servicio }
    end
  end

  # GET /ordenes_servicios/1/edit
  def edit
    @orden_servicio = OrdenServicio.find(params[:id])
    @activos = Activo.all
    @activo = Activo.new

  end

  def asigna
    if params[:id_nave].present?     
      OrdenReparacion.actualiza_estatus params[:id], params[:id_nave], Status::ASIGNADA
      redirect_to ordenes_servicios_path, :notice => "La orden de servicio fue asignada a una nave"
    else
      @ordenes_reparaciones = OrdenReparacion.joins(:orden_servicio).where("ordenes_servicios.id" => params[:id])
      @naves = Nave.obten_naves_sin_asignar_por_orden_de_servicio params[:id]
    end
  end

  # POST /ordenes_servicios
  # POST /ordenes_servicios.json
  def create
    @orden_servicio = OrdenServicio.new(params[:orden_servicio])
    @orden_servicio.user = current_user
    @activos = Activo.all
    @activo = Activo.new

    respond_to do |format|
      if @orden_servicio.save        
        format.html { redirect_to @orden_servicio, notice: 'Orden servicio was successfully created.' }
        format.json { render json: @orden_servicio, status: :created, location: @orden_servicio }
        format.pdf do
          pdf = OrdenServicioPdf.new(@orden_servicio, view_context)
          send_data pdf.render, filename: "orden_servicio.pdf",
                              type: "application/pdf",
                              disposition: "inline"
        end        
      else
        format.html { render action: "new" }
        format.json { render json: @orden_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ordenes_servicios/1
  # PUT /ordenes_servicios/1.json
  def update
    @orden_servicio = OrdenServicio.find(params[:id])

    respond_to do |format|
      if @orden_servicio.update_attributes(params[:orden_servicio])
        format.html { redirect_to @orden_servicio, notice: 'Orden servicio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @orden_servicio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ordenes_servicios/1
  # DELETE /ordenes_servicios/1.json
  def destroy
    @orden_servicio = OrdenServicio.find(params[:id])
    @orden_servicio.destroy

    respond_to do |format|
      format.html { redirect_to ordenes_servicios_url }
      format.json { head :no_content }
    end
  end
  
  def reporte_ordenes_de_servicio(ordenes_servicios)
    data = []    
    ordenes_servicios.each do |os|                       
      cabecera = {:serie => os.series.nombre,
            :folio => os.folio,
            :fecha_recepcion => os.fecha_recepcion,
            :fecha_entrega => os.fecha_entrega,
            :nombre_activo => os.activo.descripcion,
            :descripcion => os.descripcion,
            :area => os.activo.area.descripcion,
            :imagen => valida_imagenes(os.activo.imagen.path),
            :codigo_barras => genera_codigo_de_barras(os.activo.codigo),            
            :detalle_fallas => [],
            :detalle_reparaciones => [],
            :detalle_imagenes => []
            }
            
      os.falla.map do |item|      
        cabecera[:detalle_fallas] << {:fallas => item.descripcion } 
      end
      
      os.reparacion.map do |item|      
        cabecera[:detalle_reparaciones] << {:reparaciones => item.descripcion } 
      end  
      
      os.orden_imagen.map do |item|      
        cabecera[:detalle_imagenes] << {:imagenes => valida_imagenes(item.imagen.path ) } 
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
        
        header[:detalle_imagenes].each do |detalle|      
          r.page.list(:detalle_imagenes).add_row(detalle) 
        end           
      end
    end                 
    send_data report.generate, filename: 'ordenes_de_servicio.pdf', 
                               type: 'application/pdf', 
                               disposition: 'attachment'   
  end
  
  
  
  def reporte_orden_de_servicio(orden_servicio)    
    data = []                              
    cabecera = {:serie => orden_servicio.series.nombre,
                :folio => orden_servicio.folio,
                :fecha_recepcion => orden_servicio.fecha_recepcion,
                :fecha_entrega => orden_servicio.fecha_entrega,
                :nombre_activo => orden_servicio.activo.descripcion,
                :descripcion => orden_servicio.descripcion,
                :area => orden_servicio.activo.area.descripcion,
                :imagen => valida_imagenes(orden_servicio.activo.imagen.path ),
                :codigo_barras => genera_codigo_de_barras(orden_servicio.activo.codigo),            
                :detalle_fallas => [],
                :detalle_reparaciones => [],
                :detalle_imagenes => []
                }
            
    orden_servicio.falla.map do |item|      
      cabecera[:detalle_fallas] << {:fallas => item.descripcion } 
    end
      
    orden_servicio.reparacion.map do |item|      
      cabecera[:detalle_reparaciones] << {:reparaciones => item.descripcion } 
    end
    
    orden_servicio.orden_imagen.map do |item|      
      cabecera[:detalle_imagenes] << {:imagenes => valida_imagenes(item.imagen.path ) } 
    end
          
    data << cabecera         
           
    report = ThinReports::Report.create do |r|              
      r.use_layout "#{Rails.root}/app/reports/ordenes_de_servicio.tlf"
      r.start_new_page       
      data.each do |header|                         
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
        
        header[:detalle_imagenes].each do |detalle|    
          r.page.list(:detalle_imagenes).add_row(detalle)                            
        end                        
      end      
    end       
         
    send_data report.generate, filename: 'orden_de_servicio.pdf', 
                               type: 'application/pdf', 
                               disposition: 'attachment'   
  end 
  
  def valida_imagenes(imagen)  
    if File.exist?("#{imagen}")
      puts imagen      
      return imagen
    end
  end
  
  def genera_codigo_de_barras(codigo)
    doc=RGhost::Document.new :paper => [10,2], :margin => 0.5
    doc.barcode_code39("#{codigo}", :text => {:size => 16})
    doc.render :jpeg, :filename => "#{Rails.root}/tmp/#{codigo}.jpeg"
    return "#{Rails.root}/tmp/#{codigo}.jpeg" if File.exist?("#{Rails.root}/tmp/#{codigo}.jpeg")      
  end
end
