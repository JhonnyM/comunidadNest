class CreateProyectosCategorias < ActiveRecord::Migration
  def change
    create_table :proyectos_categorias do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
