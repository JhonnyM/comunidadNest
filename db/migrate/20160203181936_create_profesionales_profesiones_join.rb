class CreateProfesionalesProfesionesJoin < ActiveRecord::Migration
  def change
    create_table :profesionales_profesiones, :id => false do |t|
    	t.integer :profesional_id
    	t.integer :profesion_id
    end
    add_index :profesionales_profesiones, ["profesional_id", "profesion_id"], :name => 'index_profesionales_profesiones'
  end
end
