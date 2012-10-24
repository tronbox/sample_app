# -*- coding: utf-8 -*-
class SeriesController < ApplicationController
  load_and_authorize_resource

  # GET /series
  # GET /series.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: SeriesDatatable.new(view_context) }
      #format.pdf do
      #  pdf = SeriesPdf.new(Serie.all, view_context)
      #  send_data pdf.render, filename: "series.pdf",
      #                        type: "application/pdf",
      #                        disposition: "inline"
      #end
      format.pdf {reporte_series(Series.all)}
    end
  end

  # GET /series/1
  # GET /series/1.json
  def show
    @series = Series.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @series }
    end
  end

  # GET /series/new
  # GET /series/new.json
  def new
    @series = Series.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @series }
    end
  end

  # GET /series/1/edit
  def edit
    @series = Series.find(params[:id])
  end

  # POST /series
  # POST /series.json
  def create
    @series = Series.new(params[:series])

    respond_to do |format|
      if @series.save
        format.html { redirect_to @series, notice: 'Series se ha creado con éxito.' }
        format.json { render json: @series, status: :created, location: @series }
      else
        format.html { render action: "new" }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /series/1
  # PUT /series/1.json
  def update
    @series = Series.find(params[:id])

    respond_to do |format|
      if @series.update_attributes(params[:series])
        format.html { redirect_to @series, notice: 'Series se ha actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /series/1
  # DELETE /series/1.json
  def destroy
    @series = Series.find(params[:id])
    if @series.destroy
      message = "Serie eliminada correctamente"
    else
      message = "Serie No eliminada, contiene dependencias"
    end

    respond_to do |format|
      format.html { redirect_to series_index_url, :notice => message }
      format.json { head :no_content }
    end    
  end
  
  def reporte_series(series)
    report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'series.tlf')
    
    series.each do |serie|
      report.list.add_row do |row|        
        row.values nombre: serie.nombre        
      end 
    end
    
    send_data report.generate, filename: 'series.pdf', 
                               type: 'application/pdf', 
                               disposition: 'attachment'
  end
end
