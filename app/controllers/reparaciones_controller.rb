# -*- coding: utf-8 -*-
class ReparacionesController < ApplicationController
  load_and_authorize_resource
  # GET /reparaciones
  # GET /reparaciones.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: ReparacionesDatatable.new(view_context) }
      #format.pdf do
      #  pdf = ReparacionesPdf.new(Reparacion.all, view_context)
      #  send_data pdf.render, filename: "reparaciones.pdf",
      #                        type: "application/pdf",
      #                        disposition: "inline"
      #end
      format.pdf {reporte_reparaciones(Reparacion.all)}
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
        format.html { redirect_to @reparacion, notice: 'Reparacion se ha creado con éxito.' }
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
        format.html { redirect_to @reparacion, notice: 'Reparacion se ha actualizado correctamente.' }
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
    if @reparacion.destroy
      message = "Reparación eliminada correctamente"
    else
      message = "Reparación No eliminada, contiene dependencias"
    end

    respond_to do |format|
      format.html { redirect_to reparaciones_url, :notice => message }
      format.json { head :no_content }
    end    
  end
  
  def reporte_reparaciones(reparaciones)
    report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'reparaciones.tlf')
    
    reparaciones.each do |reparacion|
      report.list.add_row do |row|        
        row.values clave: reparacion.clave, 
                   descripcion: reparacion.descripcion,                    
                   pasos: reparacion.pasos,                                    
                   nave: reparacion.nave.nombre        
                
        row.item(:clave).style(:color, 'red')
      end 
    end
    
    send_data report.generate, filename: 'reparaciones.pdf', 
                               type: 'application/pdf', 
                               disposition: 'attachment'
  end
end
