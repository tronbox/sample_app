class OrdenesServiciosController < ApplicationController
  # GET /ordenes_servicios
  # GET /ordenes_servicios.json
  def index
    @ordenes_servicios = OrdenServicio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ordenes_servicios }
    end
  end

  # GET /ordenes_servicios/1
  # GET /ordenes_servicios/1.json
  def show
    @orden_servicio = OrdenServicio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @orden_servicio }
    end
  end

  # GET /ordenes_servicios/new
  # GET /ordenes_servicios/new.json
  def new
    @orden_servicio = OrdenServicio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @orden_servicio }
    end
  end

  # GET /ordenes_servicios/1/edit
  def edit
    @orden_servicio = OrdenServicio.find(params[:id])
  end

  # POST /ordenes_servicios
  # POST /ordenes_servicios.json
  def create
    @orden_servicio = OrdenServicio.new(params[:orden_servicio])

    respond_to do |format|
      if @orden_servicio.save
        format.html { redirect_to @orden_servicio, notice: 'Orden servicio was successfully created.' }
        format.json { render json: @orden_servicio, status: :created, location: @orden_servicio }
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
