class IndustriasController < ApplicationController
  before_action :set_industria, only: [:show, :edit, :update, :destroy]

  # GET /industrias
  # GET /industrias.json
  def index
    @industrias = Industria.all
  end

  # GET /industrias/1
  # GET /industrias/1.json
  def show
  end

  # GET /industrias/new
  def new
    @industria = Industria.new
  end

  # GET /industrias/1/edit
  def edit
  end

  # POST /industrias
  # POST /industrias.json
  def create
    @industria = Industria.new(industria_params)

    respond_to do |format|
      if @industria.save
        format.html { redirect_to @industria, notice: 'Industria was successfully created.' }
        format.json { render :show, status: :created, location: @industria }
      else
        format.html { render :new }
        format.json { render json: @industria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /industrias/1
  # PATCH/PUT /industrias/1.json
  def update
    respond_to do |format|
      if @industria.update(industria_params)
        format.html { redirect_to @industria, notice: 'Industria was successfully updated.' }
        format.json { render :show, status: :ok, location: @industria }
      else
        format.html { render :edit }
        format.json { render json: @industria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /industrias/1
  # DELETE /industrias/1.json
  def destroy
    @industria.destroy
    respond_to do |format|
      format.html { redirect_to industrias_url, notice: 'Industria was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_industria
      @industria = Industria.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def industria_params
      params[:industria]
    end
end
