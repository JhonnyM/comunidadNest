class AddProyectoIdToProyectoImagenes < ActiveRecord::Migration
  def change
  	add_column :proyecto_imagenes, :proyecto_id, :integer
  	add_column :proyecto_imagenes, :imagen, :string
  	add_column :proyecto_imagenes, :proyecto_token, :string
  	add_column :proyecto_imagenes, :descripcion, :string
  end
end
