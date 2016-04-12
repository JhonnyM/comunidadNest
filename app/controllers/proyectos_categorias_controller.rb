class ProyectosCategoriasController < ApplicationController
  before_action :set_proyectos_categoria, only: [:show, :edit, :update, :destroy]

  # GET /proyectos_categorias
  # GET /proyectos_categorias.json
  def index
    @proyectos_categorias = ProyectosCategoria.all
  end

  # GET /proyectos_categorias/1
  # GET /proyectos_categorias/1.json
  def show
  end

  # GET /proyectos_categorias/new
  def new
    @proyectos_categoria = ProyectosCategoria.new
  end

  # GET /proyectos_categorias/1/edit
  def edit
  end

  # POST /proyectos_categorias
  # POST /proyectos_categorias.json
  def create
    @proyectos_categoria = ProyectosCategoria.new(proyectos_categoria_params)

    respond_to do |format|
      if @proyectos_categoria.save
        format.html { redirect_to @proyectos_categoria, notice: 'Proyectos categoria was successfully created.' }
        format.json { render :show, status: :created, location: @proyectos_categoria }
      else
        format.html { render :new }
        format.json { render json: @proyectos_categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proyectos_categorias/1
  # PATCH/PUT /proyectos_categorias/1.json
  def update
    respond_to do |format|
      if @proyectos_categoria.update(proyectos_categoria_params)
        format.html { redirect_to @proyectos_categoria, notice: 'Proyectos categoria was successfully updated.' }
        format.json { render :show, status: :ok, location: @proyectos_categoria }
      else
        format.html { render :edit }
        format.json { render json: @proyectos_categoria.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyectos_categorias/1
  # DELETE /proyectos_categorias/1.json
  def destroy
    @proyectos_categoria.destroy
    respond_to do |format|
      format.html { redirect_to proyectos_categorias_url, notice: 'Proyectos categoria was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyectos_categoria
      @proyectos_categoria = ProyectosCategoria.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proyectos_categoria_params
      params.require(:proyectos_categoria).permit(:nombre)
    end
end
