class LicitacionImagenesController < ApplicationController
  before_action :set_licitacion_imagen, only: [:show, :edit, :update, :destroy]

  # GET /licitacion_imagenes
  # GET /licitacion_imagenes.json
  def index
    @licitacion_imagenes = LicitacionImagen.all
  end

  # GET /licitacion_imagenes/1
  # GET /licitacion_imagenes/1.json
  def show
  end

  # GET /licitacion_imagenes/new
  def new
    @licitacion_imagen = LicitacionImagen.new
  end

  # GET /licitacion_imagenes/1/edit
  def edit
  end

  # POST /licitacion_imagenes
  # POST /licitacion_imagenes.json
  def create
    @licitacion_imagen = LicitacionImagen.new(licitacion_imagen_params)

    respond_to do |format|
      if @licitacion_imagen.save
        format.html { redirect_to @licitacion_imagen, notice: 'Licitacion imagen was successfully created.' }
        format.json { render :show, status: :created, location: @licitacion_imagen }
      else
        format.html { render :new }
        format.json { render json: @licitacion_imagen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /licitacion_imagenes/1
  # PATCH/PUT /licitacion_imagenes/1.json
  def update
    respond_to do |format|
      if @licitacion_imagen.update(licitacion_imagen_params)
        format.html { redirect_to @licitacion_imagen, notice: 'Licitacion imagen was successfully updated.' }
        format.json { render :show, status: :ok, location: @licitacion_imagen }
      else
        format.html { render :edit }
        format.json { render json: @licitacion_imagen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /licitacion_imagenes/1
  # DELETE /licitacion_imagenes/1.json
  def destroy
    @licitacion_imagen.destroy
    respond_to do |format|
      format.html { redirect_to licitacion_imagenes_url, notice: 'Licitacion imagen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_licitacion_imagen
      @licitacion_imagen = LicitacionImagen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def licitacion_imagen_params
      params.require(:licitacion_imagen).permit(:descripcion, :imagen, :producto_id, :producto_token)
    end
end
