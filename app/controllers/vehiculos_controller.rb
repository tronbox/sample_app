# -*- coding: utf-8 -*- 
class VehiculosController < ApplicationController
  # GET /vehiculos
  # GET /vehiculos.json
  def index
    @vehiculos = Vehiculo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vehiculos }
      format.pdf {reporte_vehiculos(@vehiculos)}
    end
  end

  # GET /vehiculos/1
  # GET /vehiculos/1.json
  def show
    @vehiculo = Vehiculo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vehiculo }
    end
  end

  # GET /vehiculos/new
  # GET /vehiculos/new.json
  def new
    @vehiculo = Vehiculo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vehiculo }
    end
  end

  # GET /vehiculos/1/edit
  def edit
    @vehiculo = Vehiculo.find(params[:id])
  end

  # POST /vehiculos
  # POST /vehiculos.json
  def create
    @vehiculo = Vehiculo.new(params[:vehiculo])

    respond_to do |format|
      if @vehiculo.save
        format.html { redirect_to @vehiculo, notice: 'Vehículo se ha creado con éxito.' }
        format.json { render json: @vehiculo, status: :created, location: @vehiculo }
      else
        format.html { render action: "new" }
        format.json { render json: @vehiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vehiculos/1
  # PUT /vehiculos/1.json
  def update
    @vehiculo = Vehiculo.find(params[:id])

    respond_to do |format|
      if @vehiculo.update_attributes(params[:vehiculo])
        format.html { redirect_to @vehiculo, notice: 'Vehículo se ha actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vehiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehiculos/1
  # DELETE /vehiculos/1.json
  def destroy
    @vehiculo = Vehiculo.find(params[:id])
    if @vehiculo.destroy
      message = "Vehículo eliminado correctamente"
    else
      message = "Vehículo No eliminado, contiene dependencias"
    end


    respond_to do |format|
      format.html { redirect_to vehiculos_url, :notice => message }
      format.json { head :no_content }
    end
  end
  
  def reporte_vehiculos(vehiculos)
    report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'vehiculos.tlf')
    
    vehiculos.each do |vehiculo|
      report.list.add_row do |row|        
        row.values numero_de_serie: vehiculo.numero_de_serie, 
                   marca: vehiculo.marca,                    
                   linea: vehiculo.linea,
                   modelo: vehiculo.modelo,
                   numero_de_motor: vehiculo.numero_de_motor,
                   capacidad: vehiculo.capacidad,
                   combustible: vehiculo.combustible
                   
                
        row.item(:numero_de_serie).style(:color, 'red')
      end 
    end
    
    send_data report.generate, filename: 'vehiculos.pdf', 
                               type: 'application/pdf', 
                               disposition: 'attachment' 
  end
end
