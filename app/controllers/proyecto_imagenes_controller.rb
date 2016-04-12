class ProyectoImagenesController < ApplicationController
  before_action :set_proyectos_imagen, only: [:show, :edit, :update, :destroy]

  # GET /proyectos_imagenes
  # GET /proyectos_imagenes.json
  def index
    @proyecto_imagenes = ProyectoImagen.all
  end

  # GET /proyectos_imagenes/1
  # GET /proyectos_imagenes/1.json
  def show
  end

  # GET /proyectos_imagenes/new
  def new
    @proyecto_imagen = ProyectoImagen.new
  end

  # GET /proyectos_imagenes/1/edit
  def edit
    @proyecto_imagen = ProyectoImagen.find(params[:id])
  end

  # POST /proyectos_imagenes
  # POST /proyectos_imagenes.json
  def create
    @proyecto_imagen = ProyectoImagen.new(proyectos_imagen_params)

    respond_to do |format|
      if @proyecto_imagen.save
        format.html { redirect_to @proyecto_imagen, notice: 'Proyecto imagen was successfully created.' }
        format.json { render :show, status: :created, location: @proyecto_imagen }
      else
        format.html { render :new }
        format.json { render json: @proyecto_imagen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyectos_imagenes/1
  # PATCH/PUT /proyectos_imagenes/1.json
  def update
    respond_to do |format|
      if @proyecto_imagen.update(proyectos_imagen_params)
        format.html { redirect_to @proyecto_imagen, notice: 'Proyecto imagen was successfully updated.' }
        format.json { render :show, status: :ok, location: @proyecto_imagen }
      else
        format.html { render :edit }
        format.json { render json: @proyecto_imagen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyectos_imagenes/1
  # DELETE /proyectos_imagenes/1.json
  def destroy
    @proyecto_imagen.destroy
    respond_to do |format|
      format.html { redirect_to proyectos_path(@proyecto_imagen.proyecto), notice: 'La imagen ha sido borrada' }
      format.json { head :no_content }
    end
  end

  def make_default
    @proyecto_imagen = ProyectoImagen.find(params[:id])
    @proyecto = Proyecto.find(params[:proyecto_id])

    @proyecto.cover = @proyecto_imagen.id
    @proyecto.save

    respond_to do |format|
      format.js
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyectos_imagen
      @proyecto_imagen = ProyectoImagen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proyectos_imagen_params
      params.require(:proyectos_imagen).permit(:descripcion, :imagen, :proyecto_id, :proyecto_token)
    end
end
