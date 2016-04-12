class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @profesionales = Profesional.tagged_with(@tag.name)
    @empresas = Empresa.tagged_with(@tag.name)
  end
end