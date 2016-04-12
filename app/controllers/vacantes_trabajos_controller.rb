class VacantesTrabajosController < ApplicationController
  before_action :set_vacantes_trabajo, only: [:show, :edit, :update, :destroy]

  # GET /vacantes_trabajos
  # GET /vacantes_trabajos.json
  def index
    @vacantes_trabajos = VacantesTrabajo.all
  end

  # GET /vacantes_trabajos/1
  # GET /vacantes_trabajos/1.json
  def show
  end

  # GET /vacantes_trabajos/new
  def new
    @vacantes_trabajo = VacantesTrabajo.new
    @empresa_id = params[:propietario_id]
  end

  # GET /vacantes_trabajos/1/edit
  def edit
  end

  # POST /vacantes_trabajos
  # POST /vacantes_trabajos.json
  def create
    @vacantes_trabajo = VacantesTrabajo.new(vacantes_trabajo_params)

    respond_to do |format|
      if @vacantes_trabajo.save
        format.html { redirect_to @vacantes_trabajo, notice: 'Vacantes trabajo was successfully created.' }
        format.json { render :show, status: :created, location: @vacantes_trabajo }
      else
        format.html { render :new }
        format.json { render json: @vacantes_trabajo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacantes_trabajos/1
  # PATCH/PUT /vacantes_trabajos/1.json
  def update
    respond_to do |format|
      if @vacantes_trabajo.update(vacantes_trabajo_params)
        format.html { redirect_to @vacantes_trabajo, notice: 'Vacantes trabajo was successfully updated.' }
        format.json { render :show, status: :ok, location: @vacantes_trabajo }
      else
        format.html { render :edit }
        format.json { render json: @vacantes_trabajo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacantes_trabajos/1
  # DELETE /vacantes_trabajos/1.json
  def destroy
    @vacantes_trabajo.destroy
    respond_to do |format|
      format.html { redirect_to vacantes_trabajos_url, notice: 'Vacantes trabajo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacantes_trabajo
      @vacantes_trabajo = VacantesTrabajo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vacantes_trabajo_params
      params.require(:vacantes_trabajo).permit(:titulo, :empresa_id, :pais, :desripcion, :puesto, :descripcion_puesto, :requisitos, :tiempo, :salario)
    end
end
