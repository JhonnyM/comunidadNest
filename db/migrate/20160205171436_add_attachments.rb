class AddAttachments < ActiveRecord::Migration
  def change
  	add_attachment :licitacion_imagenes, :imagen
  	add_attachment :producto_imagenes, :imagen
  	add_attachment :empresas, :avatar
  	add_attachment :empresas, :page_img
  	add_attachment :empresas, :portafolio
  	add_attachment :licitacions, :documento
  end
end
