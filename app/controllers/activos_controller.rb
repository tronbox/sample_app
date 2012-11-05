# -*- coding: utf-8 -*- 
class ActivosController < ApplicationController
  load_and_authorize_resource

  # GET /activos
  # GET /activos.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: ActivosDatatable.new(view_context) }
      #format.pdf do
      #  pdf = ActivosPdf.new(Activo.all, view_context)
      #  send_data pdf.render, filename: "activos.pdf",
      #                        type: "application/pdf",
      #                        disposition: "inline"
      #end
      format.pdf {reporte_activos(Activo.all)}
    end
  end

  # GET /activos/1
  # GET /activos/1.json
  def show
    @activo = Activo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activo }
    end
  end

  # GET /activos/new
  # GET /activos/new.json
  def new
    @activo = Activo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activo }
    end
  end

  # GET /activos/1/edit
  def edit
    @activo = Activo.find(params[:id])
  end

  # POST /activos
  # POST /activos.json
  def create
    @activo = Activo.new(params[:activo])
    @activo_disponible = Activo.new

    respond_to do |format|
      if @activo.save
        format.html { redirect_to @activo, notice: 'Activo se ha creado con éxito.' }
        format.js
      else
        format.html { render action: "new" }
        format.js
      end
    end
  end

  # PUT /activos/1
  # PUT /activos/1.json
  def update
    @activo = Activo.find(params[:id])

    respond_to do |format|
      if @activo.update_attributes(params[:activo])
        format.html { redirect_to @activo, notice: 'Activo se ha actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activos/1
  # DELETE /activos/1.json
  def destroy
    @activo = Activo.find(params[:id])
    if @activo.destroy
      message = "Activo eliminado correctamente"
    else
      message = "Activo No eliminado, contiene dependencias"
    end

    respond_to do |format|
      format.html { redirect_to activos_url, :notice => message }
      format.json { head :no_content }
    end
  end
  
  def reporte_activos(activos)
    report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'activos.tlf')
    
    activos.each do |activo|
      report.list.add_row do |row|        
        row.values clave: activo.clave, 
                   descripcion: activo.descripcion,                    
                   costo_revision: activo.costo_revision,
                   area: activo.area.descripcion                   
        row.values codigo_barras: genera_codigo_de_barras(activo.codigo) if activo.codigo?
        row.values imagen: activo.imagen.path if activo.imagen? and File.exist?("#{activo.imagen.path}")        
        row.item(:clave).style(:color, 'red')
      end 
    end
    
    send_data report.generate, filename: 'activos.pdf', 
                               type: 'application/pdf', 
                               disposition: 'attachment'
  end 
  
  def genera_codigo_de_barras(codigo)
    doc=RGhost::Document.new :paper => [10,2], :margin => 0.5
    doc.barcode_code39("#{codigo}",:text => {:size => 16})
    doc.render :jpeg, :filename => "#{Rails.root}/tmp/#{codigo}.jpeg"
    return "#{Rails.root}/tmp/#{codigo}.jpeg" if File.exist?("#{Rails.root}/tmp/#{codigo}.jpeg")      
  end    
end
