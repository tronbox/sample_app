class NavesController < ApplicationController
  # GET /naves
  # GET /naves.json
  def index
    @naves = Nave.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @naves }
      format.pdf {reporte_naves(@naves)}
    end
  end

  # GET /naves/1
  # GET /naves/1.json
  def show
    @nave = Nave.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nave }
    end
  end

  # GET /naves/new
  # GET /naves/new.json
  def new
    @nave = Nave.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @nave }
    end
  end

  # GET /naves/1/edit
  def edit
    @nave = Nave.find(params[:id])
  end

  # POST /naves
  # POST /naves.json
  def create
    @nave = Nave.new(params[:nave])

    respond_to do |format|
      if @nave.save
        format.html { redirect_to @nave, notice: 'Nave was successfully created.' }
        format.json { render json: @nave, status: :created, location: @nave }
      else
        format.html { render action: "new" }
        format.json { render json: @nave.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /naves/1
  # PUT /naves/1.json
  def update
    @nave = Nave.find(params[:id])

    respond_to do |format|
      if @nave.update_attributes(params[:nave])
        format.html { redirect_to @nave, notice: 'Nave was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @nave.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /naves/1
  # DELETE /naves/1.json
  def destroy
    @nave = Nave.find(params[:id])
    if @nave.destroy
      message = "Nave industrial eliminada correctamente"
    else
      message = "Nave industrial No eliminada, contiene dependencias"
    end

    respond_to do |format|
      format.html { redirect_to naves_url, :notice => message }
      format.json { head :no_content }
    end
  end
  
  def reporte_naves(naves)
    report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'naves.tlf')
    
    naves.each do |nave|
      report.list.add_row do |row|        
        row.values clave: nave.clave, 
                   nombre: nave.nombre
                
        row.item(:clave).style(:color, 'red')
      end 
    end
    
    send_data report.generate, filename: 'naves.pdf', 
                               type: 'application/pdf', 
                               disposition: 'attachment'
  end
end
