class RelacionesArticulosMedidaController < ApplicationController
  load_and_authorize_resource
  # GET /relaciones_articulos_medida
  # GET /relaciones_articulos_medida.json
  def index
    @relaciones_articulos_medida = RelacionArticuloMedida.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @relaciones_articulos_medida }
    end
  end

  # GET /relaciones_articulos_medida/1
  # GET /relaciones_articulos_medida/1.json
  def show
    @relacion_articulo_medida = RelacionArticuloMedida.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @relacion_articulo_medida }
    end
  end

  # GET /relaciones_articulos_medida/new
  # GET /relaciones_articulos_medida/new.json
  def new
    @relacion_articulo_medida = RelacionArticuloMedida.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @relacion_articulo_medida }
    end
  end

  # GET /relaciones_articulos_medida/1/edit
  def edit
    @relacion_articulo_medida = RelacionArticuloMedida.find(params[:id])
  end

  # POST /relaciones_articulos_medida
  # POST /relaciones_articulos_medida.json
  def create
    @relacion_articulo_medida = RelacionArticuloMedida.new(params[:relacion_articulo_medida])

    respond_to do |format|
      if @relacion_articulo_medida.save
        format.html { redirect_to @relacion_articulo_medida, notice: 'Relacion articulo medida was successfully created.' }
        format.json { render json: @relacion_articulo_medida, status: :created, location: @relacion_articulo_medida }
      else
        format.html { render action: "new" }
        format.json { render json: @relacion_articulo_medida.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /relaciones_articulos_medida/1
  # PUT /relaciones_articulos_medida/1.json
  def update
    @relacion_articulo_medida = RelacionArticuloMedida.find(params[:id])

    respond_to do |format|
      if @relacion_articulo_medida.update_attributes(params[:relacion_articulo_medida])
        format.html { redirect_to @relacion_articulo_medida, notice: 'Relacion articulo medida was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @relacion_articulo_medida.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relaciones_articulos_medida/1
  # DELETE /relaciones_articulos_medida/1.json
  def destroy
    @relacion_articulo_medida = RelacionArticuloMedida.find(params[:id])
    @relacion_articulo_medida.destroy

    respond_to do |format|
      format.html { redirect_to relaciones_articulos_medida_url }
      format.json { head :no_content }
    end
  end
end
