class CreateProfesionales < ActiveRecord::Migration
  def change
    create_table :profesionales do |t|
      t.integer :status
      t.integer :user_id
      t.string :nombre
      t.text :especialidades
      t.text :descripcion
      t.string :email
      t.string :telefono
      t.string :movil
      t.string :website
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :pinterest
      t.string :linkedin
      t.integer :pais
      t.string :ciudad
      t.text :otros
      t.integer :genero
      t.date :nacimiento
      t.integer :estado_civil
      t.text :intereses
      t.string :cfia

      t.timestamps null: false
    end
  end
end
