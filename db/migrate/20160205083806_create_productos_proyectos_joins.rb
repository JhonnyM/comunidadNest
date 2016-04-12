class CreateProductosProyectosJoins < ActiveRecord::Migration
  def change
    create_table :productos_proyectos do |t|
    	t.references :producto
    	t.references :proyecto
    	t.string "rol"
    	t.integer "auorizado"
    end
    add_index :productos_proyectos, ["producto_id", "proyecto_id"], :name => 'index_productos_proyectos'
  end
end
