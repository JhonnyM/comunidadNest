class ParticipanteProyectosController < ApplicationController
  before_action :set_participante_proyecto, only: [:show, :edit, :update, :destroy]

  # GET /participante_proyectos
  # GET /participante_proyectos.json
  def index
    @participante_proyectos = ParticipanteProyecto.all
  end

  # GET /participante_proyectos/1
  # GET /participante_proyectos/1.json
  def show
  end

  # GET /participante_proyectos/new
  def new
    @participante_proyecto = ParticipanteProyecto.new
    @proyecto = Proyecto.find(params[:proyecto_id])
    @participante_proyecto.proyecto_id = params[:proyecto_id]
    respond_to do |format|
      format.html
      format.js {}
    end
  end

  # GET /participante_proyectos/1/edit
  def edit
  end

  # POST /participante_proyectos
  # POST /participante_proyectos.json
  def create
    @participante_proyecto = ParticipanteProyecto.new(participante_proyecto_params)

    if params[:profesional] && !params[:profesional][:profesional].empty?
      @participante_proyecto.participante_id = params[:profesional][:profesional]
      @participante_proyecto.nombre = Profesional.find(params[:profesional][:profesional]).nombre
    elsif params[:empresa] && !params[:empresa][:empresa].empty?
      @participante_proyecto.participante_id = params[:empresa][:empresa]
      @participante_proyecto.nombre = Empresa.find(params[:empresa][:empresa]).nombre
    end
    respond_to do |format|
      if @participante_proyecto.save
        format.html { redirect_to @participante_proyecto, notice: 'Participante proyecto was successfully created.' }
        format.js   {}
        format.json { render :show, status: :created, location: @participante_proyecto }
      else
        format.html { render :new }
        format.js   {}
        format.json { render json: @participante_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participante_proyectos/1
  # PATCH/PUT /participante_proyectos/1.json
  def update
    respond_to do |format|
      if @participante_proyecto.update(participante_proyecto_params)
        format.html { redirect_to @participante_proyecto, notice: 'Participante proyecto was successfully updated.' }
        format.json { render :show, status: :ok, location: @participante_proyecto }
      else
        format.html { render :edit }
        format.json { render json: @participante_proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participante_proyectos/1
  # DELETE /participante_proyectos/1.json
  def destroy
    @id = @participante_proyecto.id
    @participante_proyecto.destroy
    respond_to do |format|
      format.html { redirect_to participante_proyectos_url, notice: 'Participante proyecto was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render layout:false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participante_proyecto
      @participante_proyecto = ParticipanteProyecto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participante_proyecto_params
      params.require(:participante_proyecto).permit(:participante_type, :rol, :proyecto_id, :nombre)
    end
end
