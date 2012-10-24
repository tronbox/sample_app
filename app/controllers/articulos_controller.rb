# -*- coding: utf-8 -*-
class ArticulosController < ApplicationController
  load_and_authorize_resource
  # GET /articulos
  # GET /articulos.json
  def index
    @articulos = Articulo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articulos }
      format.pdf {reporte_articulos(@articulos)}
    end
  end

  # GET /articulos/1
  # GET /articulos/1.json
  def show
    @articulo = Articulo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @articulo }
    end
  end

  # GET /articulos/new
  # GET /articulos/new.json
  def new
    @articulo = Articulo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @articulo }
    end
  end

  # GET /articulos/1/edit
  def edit
    @articulo = Articulo.find(params[:id])
  end

  # POST /articulos
  # POST /articulos.json
  def create
    @articulo = Articulo.new(params[:articulo])

    respond_to do |format|
      if @articulo.save
        format.html { redirect_to @articulo, notice: 'Articulo se ha creado con éxito.' }
        format.json { render json: @articulo, status: :created, location: @articulo }
      else
        format.html { render action: "new" }
        format.json { render json: @articulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articulos/1
  # PUT /articulos/1.json
  def update
    @articulo = Articulo.find(params[:id])

    respond_to do |format|
      if @articulo.update_attributes(params[:articulo])
        format.html { redirect_to @articulo, notice: 'Articulo se ha actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @articulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articulos/1
  # DELETE /articulos/1.json
  def destroy
    @articulo = Articulo.find(params[:id])
    if @articulo.destroy
      message = "Artículo eliminado correctamente"
    else
      message = "Artículo No eliminado, contiene dependencias"
    end

    respond_to do |format|
      format.html { redirect_to articulos_url, :notice => message }
      format.json { head :no_content }
    end    
  end
  
  def reporte_articulos(articulos)
    report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'articulos.tlf')
    
    articulos.each do |articulo|
      report.list.add_row do |row|        
        row.values clave: articulo.clave, 
                   descripcion: articulo.descripcion,                    
                   descripcion_larga: articulo.descripcion_larga
                
        row.item(:clave).style(:color, 'red')
      end 
    end
    
    send_data report.generate, filename: 'articulos.pdf', 
                               type: 'application/pdf', 
                               disposition: 'attachment' 
  end 
end
