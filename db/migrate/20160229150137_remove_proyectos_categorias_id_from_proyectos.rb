class RemoveProyectosCategoriasIdFromProyectos < ActiveRecord::Migration
  def up
  	remove_column :proyectos, :proyectos_categoria_id
  end
  def down
  	add_column :proyectos, :proyectos_categoria_id, :integer
  end
end
