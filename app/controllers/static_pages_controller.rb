class StaticPagesController < ApplicationController
  def inicio
    @slides = Slide.having_status(:publico)
    @profesionales = Profesional.last(3)
    @empresas = Empresa.last(3)
    @posts = Blog.last(3)
  end

  def nosotros
  end

  def search
    @slides = Slide.having_status(:publico)
    @queue = params[:queue]
    search_results = Profesional.search(@queue).results
    profesional_ids = search_results.map {|result| result._source.id}
    @profesionales = Profesional.where(id: profesional_ids)

    search_results = Empresa.search(@queue).results
    empresas_ids = search_results.map {|result| result._source.id}
    @empresas = Empresa.where(id: empresas_ids)

    if @empresas.present?
      @empresas = @empresas.order(nombre: params[:type_orden][:orden_key]) if params[:type_orden][:orden_key].present?
      @empresas = @empresas.order(nombre: params[:type_orden][:creación_key]) if params[:type_orden][:creación_key].present?
    end

    if @profesionales.present?
      @profesionales = @profesionales.order(nombre: params[:type_orden][:orden_key]) if params[:type_orden][:orden_key].present?
      @profesionales = @profesionales.order(nombre: params[:type_orden][:creación_key]) if params[:type_orden][:creación_key].present?
    end
  end

  def contacto_new
    @contacto_mensaje = ContactoMensaje.new
  end

  def contacto_create
    @contacto_mensaje = ContactoMensaje.new(contacto_mensaje_params)

    if @contacto_mensaje.valid?
      ContactoMailer.new_mensaje(@contacto_mensaje).deliver
      ContactoMailer.thank_you_mensaje(@contacto_mensaje).deliver
      redirect_to contacto_path, notice: "Your messages has been sent."
    else
      flash[:alert] = "An error occurred while delivering this message."
      render :contacto_new
    end
  end

  def privacidad
  end

  def terminos
  end

  private

    def contacto_mensaje_params
      params.require(:contacto_mensaje).permit(:nombre, :email, :asunto, :mensaje)
    end
end
