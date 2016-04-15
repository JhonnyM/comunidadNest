class EmpresasController < ApplicationController

  before_action :set_empresa, only: [:show, :edit, :update, :destroy]

  # GET /empresas
  # GET /empresas.json
  def index
    @empresas = Empresa.all
    @industrias = Industria.all

    if params[:industria_id]
      empresas_ids = Industria.where(id: params[:industria_id]).last.empresas.ids
      @empresas = @empresas.where(id: empresas_ids) if params[:industria_id]
    end
    @params = params
  end

  def avatar
    @empresa = Empresa.find params[:empresa_id]
    render json: {img: @empresa.avatar.url(:medium)}.to_json
  end

  # GET /empresas/1
  # GET /empresas/1.json
  def show
    @proyectos = Proyecto.where("propietario_id = ? AND propietario_tipo = ?", @empresa.id, 'empresa')
    @avg_rating = @empresa.avg_rating
  end

  # GET /empresas/new
  def new
    @empresa = Empresa.new
  end

  # GET /empresas/1/edit
  def edit
  end

  # POST /empresas
  # POST /empresas.json
  def create
    @empresa = Empresa.new(empresa_params)
    @empresa.user_id = current_user.id
    respond_to do |format|
      if @empresa.save
        format.html { redirect_to @empresa, notice: 'Empresa was successfully created.' }
        format.json { render :show, status: :created, location: @empresa }
      else
        format.html { render :new }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empresas/1
  # PATCH/PUT /empresas/1.json
  def update
    respond_to do |format|
      if @empresa.update(empresa_params)
        format.html { redirect_to @empresa, notice: 'Empresa was successfully updated.' }
        format.json { render :show, status: :ok, location: @empresa }
      else
        format.html { render :edit }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empresas/1
  # DELETE /empresas/1.json
  def destroy
    @empresa.destroy
    respond_to do |format|
      format.html { redirect_to empresas_url, notice: 'Empresa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @queue = params[:queue]
    @industrias = Industria.all
    search_results = Empresa.search(@queue).results
    empresas_ids = search_results.map {|result| result._source.id}
    @empresas = Empresa.where(id: empresas_ids)

    if params[:industria][:nombre_id].present?
      industria_empresas = Industria.where(id: params[:industria][:nombre_id]).last.empresas.ids
      @empresas = @empresas.where(id: industria_empresas)
    end

    unless @empresas.present?
      @empresas = Empresa.all
      @queue = 'Todos'
    end

    @empresas = @empresas.where(pais: params[:empresa][:pais_name]) if params[:empresa][:pais_name].present?
    @empresas = @empresas.order(nombre: params[:empresias][:orden_key])
    @empresas = @empresas.order(nombre: params[:empresa][:creación_key])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresa = Empresa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empresa_params
      params.require(:empresa).permit(:descripcion, :industria_id, :telefono, :email, :servicios, :horario, :empleados, :fundacion, :avatar, :page_img, :pais, :tag_list, :nombre)
    end
end
