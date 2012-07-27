class ReparacionesController < ApplicationController
  load_and_authorize_resource
  # GET /reparaciones
  # GET /reparaciones.json
  def index
    @reparaciones = Reparacion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reparaciones }
    end
  end

  # GET /reparaciones/1
  # GET /reparaciones/1.json
  def show
    @reparacion = Reparacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reparacion }
    end
  end

  # GET /reparaciones/new
  # GET /reparaciones/new.json
  def new
    @reparacion = Reparacion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reparacion }
    end
  end

  # GET /reparaciones/1/edit
  def edit
    @reparacion = Reparacion.find(params[:id])
  end

  # POST /reparaciones
  # POST /reparaciones.json
  def create
    @reparacion = Reparacion.new(params[:reparacion])

    respond_to do |format|
      if @reparacion.save
        format.html { redirect_to @reparacion, notice: 'Reparacion was successfully created.' }
        format.json { render json: @reparacion, status: :created, location: @reparacion }
      else
        format.html { render action: "new" }
        format.json { render json: @reparacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reparaciones/1
  # PUT /reparaciones/1.json
  def update
    @reparacion = Reparacion.find(params[:id])

    respond_to do |format|
      if @reparacion.update_attributes(params[:reparacion])
        format.html { redirect_to @reparacion, notice: 'Reparacion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reparacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reparaciones/1
  # DELETE /reparaciones/1.json
  def destroy
    @reparacion = Reparacion.find(params[:id])
    @reparacion.destroy

    respond_to do |format|
      format.html { redirect_to reparaciones_url }
      format.json { head :no_content }
    end
  end
end
