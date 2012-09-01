class UseresController < ApplicationController
  # GET /useres
  # GET /useres.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: UsuariosDatatable.new(view_context) }
    end
  end

  # GET /useres/1
  # GET /useres/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /useres/new
  # GET /useres/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /useres/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /useres
  # POST /useres.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /useres/1
  # PUT /useres/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /useres/1
  # DELETE /useres/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to useres_url }
      format.json { head :no_content }
    end
  end
end
