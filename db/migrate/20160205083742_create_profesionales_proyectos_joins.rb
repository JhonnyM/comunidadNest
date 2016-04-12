class CreateProfesionalesProyectosJoins < ActiveRecord::Migration
  def change
    create_table :profesionales_proyectos do |t|
    	t.references :profesional
    	t.references :proyecto
    	t.string "rol"
    	t.integer "auorizado"
    end
    add_index :profesionales_proyectos, ["profesional_id", "proyecto_id"], :name => 'index_profesionales_proyectos'
  end
end
