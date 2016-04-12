class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.integer :status
      t.integer :user_id
      t.string :nombre
      t.integer :industria_id
      t.text :especialidades
      t.string :pais
      t.text :descripcion
      t.text :servicios
      t.text :horario
      t.integer :empleados
      t.integer :fundacion
      t.text :direccion
      t.string :email
      t.string :telefono
      t.string :telefono2
      t.string :website
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :pinterest
      t.string :linkedin
      
      t.timestamps null: false
    end
  end
end
