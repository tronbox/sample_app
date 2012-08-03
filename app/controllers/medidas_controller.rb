class MedidasController < ApplicationController
  load_and_authorize_resource
  # GET /medidas
  # GET /medidas.json
  def index
    @medidas = Medida.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @medidas }
    end
  end

  # GET /medidas/1
  # GET /medidas/1.json
  def show
    @medida = Medida.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @medida }
    end
  end

  # GET /medidas/new
  # GET /medidas/new.json
  def new
    @medida = Medida.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @medida }
    end
  end

  # GET /medidas/1/edit
  def edit
    @medida = Medida.find(params[:id])
  end

  # POST /medidas
  # POST /medidas.json
  def create
    @medida = Medida.new(params[:medida])

    respond_to do |format|
      if @medida.save
        format.html { redirect_to @medida, notice: 'Medida was successfully created.' }
        format.json { render json: @medida, status: :created, location: @medida }
      else
        format.html { render action: "new" }
        format.json { render json: @medida.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /medidas/1
  # PUT /medidas/1.json
  def update
    @medida = Medida.find(params[:id])

    respond_to do |format|
      if @medida.update_attributes(params[:medida])
        format.html { redirect_to @medida, notice: 'Medida was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @medida.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medidas/1
  # DELETE /medidas/1.json
  def destroy
    @medida = Medida.find(params[:id])
    @medida.destroy

    respond_to do |format|
      format.html { redirect_to medidas_url }
      format.json { head :no_content }
    end
  end
end