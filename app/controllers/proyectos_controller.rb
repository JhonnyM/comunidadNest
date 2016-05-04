class ProyectosController < ApplicationController
  before_action :set_proyecto, only: [:show, :edit, :update, :destroy]

  has_scope :by_categoria


  # GET /proyectos
  # GET /proyectos.json
  def index
    @proyectos = Proyecto.all
    if params[:categoria]
      proyectos_ids = ProyectosCategoria.where(id: params[:categoria]).last.proyecto_ids
      @proyectos = @proyectos.where(id: proyectos_ids)
    end
    @categorias = ProyectosCategoria.all
  end

  # GET /proyectos/1
  # GET /proyectos/1.json
  def show
    @imagenes = @proyecto.proyecto_imagenes
    @participante_proyectos = @proyecto.participante_proyectos
  end

  # GET /proyectos/new
  def new
    @proyecto = Proyecto.new
    @categorias = ProyectosCategoria.all
    @propietario_id = params[:propietario_id]
    @propietario_tipo = params[:propietario_tipo]
  end

  # GET /proyectos/1/edit
  def edit
    @categorias = ProyectosCategoria.all
    @imagenes = @proyecto.proyecto_imagenes
  end

  # POST /proyectos
  # POST /proyectos.json
  def create
    @proyecto = Proyecto.new(proyecto_params)

    respond_to do |format|
      if @proyecto.save
        @proyecto.imagenes = params[:proyecto][:imagenes] if params[:proyecto][:imagenes].present?
        format.html { redirect_to @proyecto, notice: 'Proyecto creado correctamente' }
        format.json { render :show, status: :created, location: @proyecto }
        format.js
      else
        format.html { render :new }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /proyectos/1
  # PATCH/PUT /proyectos/1.json
  def update
    respond_to do |format|
      if @proyecto.update(proyecto_params)
        @proyecto.imagenes = params[:proyecto][:imagenes] if params[:proyecto][:imagenes].present?
        format.html { redirect_to @proyecto, notice: 'Proyecto editado correctamente.' }
        format.json { render :show, status: :ok, location: @proyecto }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /proyectos/1
  # DELETE /proyectos/1.json
  def destroy
    @proyecto.destroy
    respond_to do |format|
      format.html { redirect_to proyectos_url, notice: 'Proyecto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @queue = params[:queue]
    @categorias = ProyectosCategoria.all
    search_results = Proyecto.search(@queue).results
    proyectos_ids = search_results.map {|result| result._source.id}
    @proyectos = Proyecto.where(id: proyectos_ids)

    if params[:proyecto][:propietario_tipo].present?
      proyectos_propertario = Proyecto.where(propietario_tipo: params[:proyecto][:propietario_tipo]).pluck(:id).uniq
      @proyectos = @proyectos.where(id: proyectos_propertario)
    end

    if params[:proyecto][:nombre].present?
      proyectos_categorias = ProyectosCategoria.where(nombre: params[:proyecto][:nombre]).last.proyectos.ids
      @proyectos = @proyectos.where(id: proyectos_categorias)
    end

    unless @proyectos.present?
      @proyectos = Proyecto.all
      @queue = 'Todos'
    end
    @proyectos = @proyectos.where(pais: params[:proyecto][:pais_name]) if params[:proyecto][:pais_name].present?
    @proyectos = @proyectos.order(titulo: params[:proyectios][:orden_key]).order(titulo: params[:proyecto][:creación_key])
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto
      @proyecto = Proyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proyecto_params
      params.require(:proyecto).permit(*Proyecto.white_list)
    end
end
