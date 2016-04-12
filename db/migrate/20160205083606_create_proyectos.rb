class CreateProyectos < ActiveRecord::Migration
  def change
    create_table :proyectos do |t|
      t.string :titulo
      t.text :descripcion
      t.string :pais
      t.string :ciudad
      t.integer :area
      t.integer :fecha
      t.integer :proyectos_categoria_id
      t.integer :status_proyecto
      t.integer :status
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
