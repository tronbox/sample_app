class RecepcionesActivosController < ApplicationController
  # GET /recepciones_activos
  # GET /recepciones_activos.json
  def index
    @recepciones_activos = RecepcionActivo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recepciones_activos }
      format.pdf {reporte_recepcion_activo(@recepciones_activos)}
    end
  end

  # GET /recepciones_activos/1
  # GET /recepciones_activos/1.json
  def show
    @recepcion_activo = RecepcionActivo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recepcion_activo }
    end
  end

  # GET /recepciones_activos/new
  # GET /recepciones_activos/new.json
  def new
    @recepcion_activo = RecepcionActivo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recepcion_activo }
    end
  end

  # GET /recepciones_activos/1/edit
  def edit
    @recepcion_activo = RecepcionActivo.find(params[:id])
  end

  # POST /recepciones_activos
  # POST /recepciones_activos.json
  def create
    @recepcion_activo = RecepcionActivo.new(params[:recepcion_activo])

    respond_to do |format|
      if @recepcion_activo.save
        format.html { redirect_to @recepcion_activo, notice: 'Recepcion activo was successfully created.' }
        format.json { render json: @recepcion_activo, status: :created, location: @recepcion_activo }
      else
        format.html { render action: "new" }
        format.json { render json: @recepcion_activo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recepciones_activos/1
  # PUT /recepciones_activos/1.json
  def update
    @recepcion_activo = RecepcionActivo.find(params[:id])

    respond_to do |format|
      if @recepcion_activo.update_attributes(params[:recepcion_activo])
        format.html { redirect_to @recepcion_activo, notice: 'Recepcion activo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recepcion_activo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recepciones_activos/1
  # DELETE /recepciones_activos/1.json
  def destroy
    @recepcion_activo = RecepcionActivo.find(params[:id])
    @recepcion_activo.destroy

    respond_to do |format|
      format.html { redirect_to recepciones_activos_url }
      format.json { head :no_content }
    end
  end
  
  def reporte_recepcion_activo(recepciones_activos)
    report = ThinReports::Report.new layout: File.join(Rails.root, 'app', 'reports', 'recepcion_activo.tlf')
    
    recepciones_activos.each do |recepcion_activo|
      report.list.add_row do |row|        
        row.values agente: recepcion_activo.agente.nombre, 
                   vehiculo: recepcion_activo.vehiculo.linea,                    
                   fecha_recepcion: recepcion_activo.fecha_recepcion,
                   descripcion: recepcion_activo.descripcion                   
      end 
    end
    
    send_data report.generate, filename: 'recepcion_activo.pdf', 
                               type: 'application/pdf', 
                               disposition: 'attachment' 
  end
end
