# -*- coding: utf-8 -*-
class CategoriasController < ApplicationController
  #load_and_authorize_resource
  # GET /categorias
  # GET /categorias.json
  def index
    @categorias = Categoria.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categorias }
      #format.pdf do
      #  pdf = CategoriasPdf.new(@categorias, view_context)
      #  send_data pdf.render, filename: "categorias.pdf",
      #                        type: "application/pdf",
      #                        disposition: "inline"
      #end
      format.pdf {reporte_categorias(@categorias)}
      format.xls {send_data @categorias.to_xls, :filename => 'reporte.xls' }
    end
  end

# GET /categorias/reporte
  # GET /categorias/reporte.pdf  
  def reporte
    puts "======================================================================================================"
    @categorias_pdf = Categorias.all

    respond_to do |format|    
      format.pdf do
        pdf = CategoriasPdf.new(@categorias_pdf, view_context)
        send_data pdf.render, filename: "categorias.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end     
    end
  end

  # GET /categorias/1
  # GET /categorias/1.json
  def show
    @categoria = Categoria.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @categoria }
    end
  end

  # GET /categorias/new
  # GET /categorias/new.json
  def new
    @categoria = Categoria.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @categoria }
    end
  end

  # GET /categorias/1/edit
  def edit
    @categoria = Categoria.find(params[:id])
  end

  # POST /categorias
  # POST /categorias.json
  def create
    @categoria = Categoria.new(params[:categoria])

    respond_to do |format|
      if @categoria.save
        format.html { redirect_to @categoria, notice: 'Categoria se ha creado con éxito.' }
        format.json { render json: @categoria, status: :created, location: @categoria }
      else
        format.html { render action: "new" }
        format.json { render json: @categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categorias/1
  # PUT /categorias/1.json
  def update
    @categoria = Categoria.find(params[:id])

    respond_to do |format|
      if @categoria.update_attributes(params[:categoria])
        format.html { redirect_to @categoria, notice: 'Categoria se ha actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categorias/1
  # DELETE /categorias/1.json
  def destroy
    @categoria = Categoria.find(params[:id])
    @categoria.destroy

    respond_to do |format|
      format.html { redirect_to categorias_url }
      format.json { head :no_content }
    end
  end
  
  def reporte_categorias(categorias)
    report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'categorias.tlf')
    
    categorias.each do |categoria|
      report.list.add_row do |row|        
        row.values clave: categoria.clave, 
                   descripcion: categoria.descripcion
                
        row.item(:clave).style(:color, 'red')
      end 
    end
    
    send_data report.generate, filename: 'categorias.pdf', 
                               type: 'application/pdf', 
                               disposition: 'attachment'
  end
end
