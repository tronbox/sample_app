# -*- coding: utf-8 -*-
class FallasController < ApplicationController
  load_and_authorize_resource
  # GET /fallas
  # GET /fallas.json
  def index
    @fallas = Falla.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fallas }
      format.pdf do
        pdf = FallasPdf.new(@fallas, view_context)
        send_data pdf.render, filename: "fallas.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
      format.xls {send_data @fallas.to_xls, :filename => 'reporte.xls' }
    end
  end

  # GET /fallas/reporte
  # GET /fallas/reporte.pdf  
  def reporte
    puts "======================================================================================================"
    @fallas_pdf = Fallas.all

    respond_to do |format|    
      format.pdf do
        pdf = FallasPdf.new(@fallas_pdf, view_context)
        send_data pdf.render, filename: "fallas.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end     
    end
  end


  # GET /fallas/1
  # GET /fallas/1.json
  def show
    @falla = Falla.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @falla }
    end
  end

  # GET /fallas/new
  # GET /fallas/new.json
  def new
    @falla = Falla.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @falla }
    end
  end

  # GET /fallas/1/edit
  def edit
    @falla = Falla.find(params[:id])
  end

  # POST /fallas
  # POST /fallas.json
  def create
    @falla = Falla.new(params[:falla])

    respond_to do |format|
      if @falla.save
        format.html { redirect_to @falla, notice: 'Falla se ha creado con éxito.' }
        format.json { render json: @falla, status: :created, location: @falla }
      else
        format.html { render action: "new" }
        format.json { render json: @falla.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fallas/1
  # PUT /fallas/1.json
  def update
    @falla = Falla.find(params[:id])

    respond_to do |format|
      if @falla.update_attributes(params[:falla])
        format.html { redirect_to @falla, notice: 'Falla se ha actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @falla.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fallas/1
  # DELETE /fallas/1.json
  def destroy
    @falla = Falla.find(params[:id])
    if @falla.destroy
      message = "Falla eliminada correctamente"
    else
      message = "Falla No eliminada, contiene dependencias"
    end

    respond_to do |format|
      format.html { redirect_to fallas_url, :notice => message }
      format.json { head :no_content }
    end      
  end
end
