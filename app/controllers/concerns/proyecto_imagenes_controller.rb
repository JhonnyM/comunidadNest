class ProyectoImagenesController < ApplicationController
  # GET /proyecto_imagenes
  # GET /proyecto_imagenes.json
  def index

    @proyecto = Proyecto.find(params[:gallery_id])

    @proyecto_imagenes = @proyecto.proyecto_imagenes

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @proyecto_imagenes }
    end
  end

  # GET /proyecto_imagenes/1
  # GET /proyecto_imagenes/1.json
  def show
    @proyecto_imagen = ProyectoImagen.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @proyecto_imagen }
    end
  end

  # GET /proyecto_imagenes/new
  # GET /proyecto_imagenes/new.json
  def new
    @proyecto = Proyecto.find(params[:gallery_id])
    @proyecto_imagen = @proyecto.proyecto_imagenes.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @proyecto_imagen }
    end
  end

  # GET /proyecto_imagenes/1/edit
  def edit
    #@proyecto = Proyecto.find(params[:gallery_id])

    @proyecto_imagen = ProyectoImagen.find(params[:id])
    # @proyecto_imagen = ProyectoImagen.find(params[:id])
  end

  # POST /proyecto_imagenes
  # POST /proyecto_imagenes.json
  def create
    @proyecto_imagen = ProyectoImagen.new(params[:proyecto_imagen])

    if @proyecto_imagen.save
      respond_to do |format|
        format.html {
          render :json => [@proyecto_imagen.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@proyecto_imagen.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  # PUT /proyecto_imagenes/1
  # PUT /proyecto_imagenes/1.json
  def update

    @proyecto = Proyecto.find(params[:gallery_id])

    @proyecto_imagen = @proyecto.proyecto_imagenes.find(params[:id])

    respond_to do |format|
      if @proyecto_imagen.update_attributes(proyecto_imagen_params)
        format.html { redirect_to gallery_path(@proyecto), notice: 'ProyectoImagen was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @proyecto_imagen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proyecto_imagenes/1
  # DELETE /proyecto_imagenes/1.json
  def destroy
    #@proyecto = Proyecto.find(params[:gallery_id])
    #@proyecto_imagen = @proyecto.proyecto_imagenes.find(params[:id])
    @proyecto_imagen = ProyectoImagen.find(params[:id])
    @proyecto_imagen.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def make_default
    @proyecto_imagen = ProyectoImagen.find(params[:id])
    @proyecto = Proyecto.find(params[:gallery_id])

    @proyecto.cover = @proyecto_imagen.id
    @proyecto.save

    respond_to do |format|
      format.js
    end
  end

  private

  def proyecto_imagen_params
    params.require(:proyecto_imagen).permit(:description, :gallery_id, :image)
  end
end