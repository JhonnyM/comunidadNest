class AddProyectosCategoriasProyectosJoinTable < ActiveRecord::Migration
  def change
  	create_table :proyectos_proyectos_categorias do |t|
      t.belongs_to :proyecto, index: true
      t.belongs_to :proyectos_categoria, index: true
      t.timestamps null: false
    end
  end
end
