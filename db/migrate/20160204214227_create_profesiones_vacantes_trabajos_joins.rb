class CreateProfesionesVacantesTrabajosJoins < ActiveRecord::Migration
  def change
    create_table :profesiones_vacantes_trabajos, :id => false do |t|
    	t.integer "profesion_id"
    	t.integer "vacantes_trabajos_id"
    end
    add_index :profesiones_vacantes_trabajos, ["profesion_id", "vacantes_trabajos_id"], :name => 'index_profesiones_vancantes_trabajos'
  end
end
