# -*- coding: utf-8 -*- 
class ActivosController < ApplicationController
  load_and_authorize_resource

  # GET /activos
  # GET /activos.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: ActivosDatatable.new(view_context) }
      format.pdf do
        pdf = ActivosPdf.new(Activo.all, view_context)
        send_data pdf.render, filename: "activos.pdf",
                              type: "application/pdf",
                              disposition: "inline"
      end
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
    @activo.destroy

    respond_to do |format|
      format.html { redirect_to activos_url }
      format.json { head :no_content }
    end
  end
end
