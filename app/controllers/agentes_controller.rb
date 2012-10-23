# -*- coding: utf-8 -*-
class AgentesController < ApplicationController
  load_and_authorize_resource
  # GET /agentes
  # GET /agentes.json
  def index     
    @agentes = Agente.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @agentes }
      #format.pdf do
      #  pdf = AgentesPdf.new(@agentes, view_context)
      #  send_data pdf.render, filename: "agentes.pdf",
      #                        type: "application/pdf",
      #                        disposition: "inline"
      #end
      format.pdf {reporte_agentes(@agentes)}
      format.xls {send_data @agentes.to_xls, :filename => 'reporte.xls' }
    end
  end
  
  # GET /agentes/reporte
  # GET /agentes/reporte.pdf  
  def reporte
    puts "======================================================================================================"
    @agentes_pdf = Agente.all

    respond_to do |format|    
      format.pdf do
        pdf = AgentesPdf.new(@agentes_pdf, view_context)
        send_data pdf.render, filename: "agentes.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end     
    end
  end
  
  # GET /agentes/1
  # GET /agentes/1.json
  def show
    @agente = Agente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @agente }      
    end
  end

  # GET /agentes/new
  # GET /agentes/new.json
  def new
    @agente = Agente.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @agente }
    end
  end

  # GET /agentes/1/edit
  def edit
    @agente = Agente.find(params[:id])
  end

  # POST /agentes
  # POST /agentes.json
  def create
    @agente = Agente.new(params[:agente])

    respond_to do |format|
      if @agente.save
        format.html { redirect_to @agente, notice: 'Agente se ha creado con éxito.' }
        format.json { render json: @agente, status: :created, location: @agente }
      else
        format.html { render action: "new" }
        format.json { render json: @agente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /agentes/1
  # PUT /agentes/1.json
  def update
    @agente = Agente.find(params[:id])

    respond_to do |format|
      if @agente.update_attributes(params[:agente])
        format.html { redirect_to @agente, notice: 'Agente se ha actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @agente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agentes/1
  # DELETE /agentes/1.json
  def destroy
    @agente = Agente.find(params[:id])
    if @agente.destroy
      message = "Agente eliminado correctamente"
    else
      message = "Agente No eliminado, contiene dependencias"
    end

    respond_to do |format|
      format.html { redirect_to agentes_url, :notice => message }
      format.json { head :no_content }
    end  
  end
  
  def reporte_agentes(agentes)
    report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'agentes.tlf')
    
    agentes.each do |agente|
      report.list.add_row do |row|        
        row.values clave: agente.clave, 
                   nombre: agente.nombre,                    
                   e_mail: agente.e_mail,
                                     
                   nave: agente.nave.nombre
        row.values responsable: "Si" if agente.responsable?
                
        row.item(:clave).style(:color, 'red')
      end 
    end
    
    send_data report.generate, filename: 'activos.pdf', 
                               type: 'application/pdf', 
                               disposition: 'attachment'
  end
end
