class IndustriaController < ApplicationController
  before_action :set_industrium, only: [:show, :edit, :update, :destroy]

  # GET /industria
  # GET /industria.json
  def index
    @industria = Industrium.all
  end

  # GET /industria/1
  # GET /industria/1.json
  def show
  end

  # GET /industria/new
  def new
    @industrium = Industrium.new
  end

  # GET /industria/1/edit
  def edit
  end

  # POST /industria
  # POST /industria.json
  def create
    @industrium = Industrium.new(industrium_params)

    respond_to do |format|
      if @industrium.save
        format.html { redirect_to @industrium, notice: 'Industrium was successfully created.' }
        format.json { render :show, status: :created, location: @industrium }
      else
        format.html { render :new }
        format.json { render json: @industrium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /industria/1
  # PATCH/PUT /industria/1.json
  def update
    respond_to do |format|
      if @industrium.update(industrium_params)
        format.html { redirect_to @industrium, notice: 'Industrium was successfully updated.' }
        format.json { render :show, status: :ok, location: @industrium }
      else
        format.html { render :edit }
        format.json { render json: @industrium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /industria/1
  # DELETE /industria/1.json
  def destroy
    @industrium.destroy
    respond_to do |format|
      format.html { redirect_to industria_url, notice: 'Industrium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_industrium
      @industrium = Industrium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def industrium_params
      params.require(:industrium).permit(:nombre)
    end
end
