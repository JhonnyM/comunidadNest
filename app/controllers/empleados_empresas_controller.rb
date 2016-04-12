class EmpleadosEmpresasController < ApplicationController
  before_action :set_empleados_empresa, only: [:show, :edit, :update, :destroy]

  # GET /empleados_empresas
  # GET /empleados_empresas.json
  def index
    @empleados_empresas = EmpleadosEmpresa.all
  end

  # GET /empleados_empresas/1
  # GET /empleados_empresas/1.json
  def show
  end

  # GET /empleados_empresas/new
  def new
    @empleados_empresa = EmpleadosEmpresa.new
    @empresa = Empresa.find(params[:empresa_id])
    @all_profesionales = Profesional.all
    @profesionales = @all_profesionales.each_with_index.map { |profesional| [profesional.nombre, profesional.id] }
  end

  # GET /empleados_empresas/1/edit
  def edit
  end

  # POST /empleados_empresas
  # POST /empleados_empresas.json
  def create
    @empleados_empresa = EmpleadosEmpresa.new(empleados_empresa_params)
    @empleados_empresa.status = 0

    respond_to do |format|
      if @empleados_empresa.save
        format.html { redirect_to @empleados_empresa, notice: 'Miembro de equipo de trabajo agregado correctamente' }
        format.json { render :show, status: :created, location: @empleados_empresa }
      else
        format.html { render :new }
        format.json { render json: @empleados_empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empleados_empresas/1
  # PATCH/PUT /empleados_empresas/1.json
  def update
    respond_to do |format|
      if @empleados_empresa.update(empleados_empresa_params)
        format.html { redirect_to @empleados_empresa, notice: 'Empleados empresa was successfully updated.' }
        format.json { render :show, status: :ok, location: @empleados_empresa }
      else
        format.html { render :edit }
        format.json { render json: @empleados_empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empleados_empresas/1
  # DELETE /empleados_empresas/1.json
  def destroy
    @empleados_empresa.destroy
    respond_to do |format|
      format.html { redirect_to empleados_empresas_url, notice: 'Empleados empresa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def aceptar_solicitud_empleado
    @empleados_empresa = EmpleadosEmpresa.find(params[:id])
    
    respond_to do |format|
      if @empleados_empresa.autorizar!
        format.html {}
        format.js {}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empleados_empresa
      @empleados_empresa = EmpleadosEmpresa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empleados_empresa_params
      params.require(:empleados_empresa).permit(:empresa_id, :profesional_id, :puesto)
    end
end
