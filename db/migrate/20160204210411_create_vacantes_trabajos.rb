class CreateVacantesTrabajos < ActiveRecord::Migration
  def change
    create_table :vacantes_trabajos do |t|
      t.string :titulo
      t.integer :empresa_id
      t.string :pais
      t.text :desripcion
      t.string :puesto
      t.text :descripcion_puesto
      t.text :requisitos
      t.string :tiempo
      t.string :salario

      t.timestamps null: false
    end
  end
end
