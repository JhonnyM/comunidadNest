class CreateLicitacionImagenes < ActiveRecord::Migration
  def change
    create_table :licitacion_imagenes do |t|
      t.string :descripcion
      t.string :imagen
      t.integer :licitacion_id
      t.string :licitacion_token

      t.timestamps null: false
    end
  end
end
