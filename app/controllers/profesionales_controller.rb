class ProfesionalesController < ApplicationController
  before_action :set_profesional, only: [:show, :edit, :update, :destroy]
  has_scope :by_profesion
  has_scope :by_pais
  has_scope :by_alphabetic
  has_scope :by_period

  # GET /profesionales
  # GET /profesionales.json
  def index
    @profesionales = Profesional.all
    if params[:profesion_id]
      profesionales_ids = Profesion.where(id: params[:profesion_id]).last.profesionales.ids
      @profesionales = @profesionales.where(id: profesionales_ids) if params[:profesion_id]
    end
    @params = params
    @profesiones = Profesion.all
  end

  def avatar
    @profesional = Profesional.find params[:profesional_id]
    render json: {img: @profesional.avatar.url(:medium)}.to_json
  end

  # GET /profesionales/1
  # GET /profesionales/1.json
  def show
    @proyectos = Proyecto.where("propietario_id = ? AND propietario_tipo = ?", @profesional.id, 'profesional')
    @productos = Producto.where("propietario_id = ? AND propietario_tipo = ?", @profesional.id, 'profesional')
    @experiencia = Experiencia.new
    @estudio = Estudio.new
    @is_owner = @profesional.is_owner? current_user
    @avg_rating = @profesional.avg_rating
  end

  # GET /profesionales/new
  def new
    @profesional = Profesional.new
  end

  # GET /profesionales/1/edit
  def edit
  end

  # POST /profesionales
  # POST /profesionales.json
  def create
    @profesional = Profesional.new(profesional_params)
    @profesional.user_id = current_user.id
    @profesional.status = 1

    respond_to do |format|
      if @profesional.save
        format.html { redirect_to @profesional, notice: 'Perfil de profesional creado correctamente. Ahora agrega tus experiencia profesional y estudios.' }
        format.json { render :show, status: :created, location: @profesional }
      else
        format.html { render :new }
        format.json { render json: @profesional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profesionales/1
  # PATCH/PUT /profesionales/1.json
  def update
    respond_to do |format|
      if @profesional.update(profesional_params)
        format.html { redirect_to @profesional, notice: 'Perfil de profesional actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @profesional }
      else
        format.html { render :edit }
        format.json { render json: @profesional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profesionales/1
  # DELETE /profesionales/1.json
  def destroy
    @profesional.destroy
    respond_to do |format|
      format.html { redirect_to profesionales_url, notice: 'Perfil de profesional eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  def search
    @queue = params[:queue]
    @profesiones = Profesion.all
    search_results = Profesional.search(@queue).results
    profesional_ids = search_results.map {|result| result._source.id}
    @profesionales = Profesional.where(id: [profesional_ids])

    if params[:profesion][:generico_id].present?
      profesion_profesionales = Profesion.where(id: params[:profesion][:generico_id]).last.profesionales.ids
      @profesionales = @profesionales.where(id: profesion_profesionales)
    end

    unless @profesionales.present?
      @profesionales = Profesional.all
      @queue = 'Todos'
    end

    @profesionales = @profesionales.where(pais: params[:profesional][:pais_name]) if params[:profesional][:pais_name].present?
    @profesionales = @profesionales.order(nombre: params[:profies][:orden_key])
    @profesionales = @profesionales.order(nombre: params[:profies][:creación_key])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profesional
      @profesional = Profesional.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profesional_params
      params.require(:profesional).permit(:especialidades, :descripcion, :email, :telefono, :facebook, :twitter, :instagram, :pinterest, :linkedin, :pais, :ciudad, :otros, :genero, :nacimiento, :profesion_id, :estado_civil, :intereses, :avatar, :page_img, :tag_list, :idiomas =>[])
    end
end
