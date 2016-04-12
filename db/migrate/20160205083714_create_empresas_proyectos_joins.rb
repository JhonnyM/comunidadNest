class CreateEmpresasProyectosJoins < ActiveRecord::Migration
  def change
    create_table :empresas_proyectos do |t|
    	t.references :empresa
    	t.references :proyecto
    	t.string "rol"
    	t.integer "auorizado"
    end
    add_index :empresas_proyectos, ["empresa_id", "proyecto_id"], :name => 'index_empresas_proyectos'
  end
end
