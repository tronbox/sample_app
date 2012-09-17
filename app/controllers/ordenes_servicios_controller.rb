class OrdenesServiciosController < ApplicationController
  # GET /ordenes_servicios
  # GET /ordenes_servicios.json
  def index
    @ordenes_servicios = OrdenServicio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ordenes_servicios }
      format.pdf do
        pdf = OrdenesServicioPdf.new(@ordenes_servicios, view_context)
        send_data pdf.render, filename: "orden_servicio.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
    end
  end

  # GET /ordenes_servicios/1
  # GET /ordenes_servicios/1.json
  def show
    @orden_servicio = OrdenServicio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @orden_servicio }
      format.pdf do
        pdf = OrdenServicioPdf.new(@orden_servicio, view_context)
        send_data pdf.render, filename: "orden_servicio.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
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
end
