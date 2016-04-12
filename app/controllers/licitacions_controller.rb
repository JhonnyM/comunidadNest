class LicitacionsController < ApplicationController
  before_action :set_licitacion, only: [:show, :edit, :update, :destroy]

  # GET /licitacions
  # GET /licitacions.json
  def index
    @licitacions = Licitacion.all
  end

  # GET /licitacions/1
  # GET /licitacions/1.json
  def show
    
  end

  # GET /licitacions/new
  def new
    @licitacion = Licitacion.new
    @empresa_id = params[:propietario_id]
  end

  # GET /licitacions/1/edit
  def edit
  end

  # POST /licitacions
  # POST /licitacions.json
  def create
    @licitacion = Licitacion.new(licitacion_params)

    respond_to do |format|
      if @licitacion.save

        if params[:images]
          #===== The magic is here ;)
          params[:images].each { |imagen|
            @licitacion.licitacion_imagenes.create(imagen: imagen)
          }
        end

        format.html { redirect_to @licitacion, notice: 'Licitacion was successfully created.' }
        format.json { render :show, status: :created, location: @licitacion }
      else
        format.html { render :new }
        format.json { render json: @licitacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /licitacions/1
  # PATCH/PUT /licitacions/1.json
  def update
    respond_to do |format|
      if @licitacion.update(licitacion_params)

        if params[:images]
          #===== The magic is here ;)
          params[:images].each { |imagen|
            @licitacion.licitacion_imagenes.create(imagen: imagen)
          }
        end

        format.html { redirect_to @licitacion, notice: 'Licitacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @licitacion }
      else
        format.html { render :edit }
        format.json { render json: @licitacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /licitacions/1
  # DELETE /licitacions/1.json
  def destroy
    @licitacion.destroy
    respond_to do |format|
      format.html { redirect_to licitacions_url, notice: 'Licitacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_licitacion
      @licitacion = Licitacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def licitacion_params
      params.require(:licitacion).permit(:titulo, :pais, :cantidad, :unidad_medida, :producto_categoria_id, :especificaciones, :precio_minimo, :precio_maximo, :tipo_de_cambio, :entrega, :plazo, :observaciones, :documento, :empresa_id, :licitacion_imagenes)
    end
end
