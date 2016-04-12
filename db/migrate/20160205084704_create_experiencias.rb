class CreateExperiencias < ActiveRecord::Migration
  def change
    create_table :experiencias do |t|
      t.integer :profesional_id
      t.string :empresa
      t.string :puesto
      t.string :inicio
      t.string :salida

      t.timestamps null: false
    end
  end
end
