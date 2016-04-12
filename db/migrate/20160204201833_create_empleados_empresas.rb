class CreateEmpleadosEmpresas < ActiveRecord::Migration
  def change
    create_table :empleados_empresas do |t|
    	t.references :empresa
    	t.references :profesional
    	t.integer :status
    	t.string :puesto
    	t.timestamps
    end
    add_index :empleados_empresas, ["empresa_id", "profesional_id"], :name => 'index_empleados_empresas'
  end
end