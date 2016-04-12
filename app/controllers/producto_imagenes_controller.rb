class ProductoImagenesController < ApplicationController
  before_action :set_producto_imagen, only: [:show, :edit, :update, :destroy]

  # GET /producto_imagenes
  # GET /producto_imagenes.json
  def index
    @producto_imagenes = ProductoImagen.all
  end

  # GET /producto_imagenes/1
  # GET /producto_imagenes/1.json
  def show
  end

  # GET /producto_imagenes/new
  def new
    @producto_imagen = ProductoImagen.new
  end

  # GET /producto_imagenes/1/edit
  def edit
  end

  # POST /producto_imagenes
  # POST /producto_imagenes.json
  def create
    @producto_imagen = ProductoImagen.new(producto_imagen_params)

    respond_to do |format|
      if @producto_imagen.save
        format.html { redirect_to @producto_imagen, notice: 'Producto imagen was successfully created.' }
        format.json { render :show, status: :created, location: @producto_imagen }
      else
        format.html { render :new }
        format.json { render json: @producto_imagen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /producto_imagenes/1
  # PATCH/PUT /producto_imagenes/1.json
  def update
    respond_to do |format|
      if @producto_imagen.update(producto_imagen_params)
        format.html { redirect_to @producto_imagen, notice: 'Producto imagen was successfully updated.' }
        format.json { render :show, status: :ok, location: @producto_imagen }
      else
        format.html { render :edit }
        format.json { render json: @producto_imagen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /producto_imagenes/1
  # DELETE /producto_imagenes/1.json
  def destroy
    @producto_imagen.destroy
    respond_to do |format|
      format.html { redirect_to producto_imagenes_url, notice: 'Producto imagen was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto_imagen
      @producto_imagen = ProductoImagen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def producto_imagen_params
      params.require(:producto_imagen).permit(:descripcion, :imagen, :producto_id, :producto_token)
    end
end
