class CreateProyectoImagenes < ActiveRecord::Migration
  def change
    create_table :proyecto_imagenes do |t|

      t.timestamps null: false
    end
    add_attachment :proyecto_imagenes, :imagen
  end
end
