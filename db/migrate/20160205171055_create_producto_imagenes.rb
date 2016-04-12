class CreateProductoImagenes < ActiveRecord::Migration
  def change
    create_table :producto_imagenes do |t|
      t.string :descripcion
      t.string :imagen
      t.integer :producto_id
      t.string :producto_token

      t.timestamps null: false
    end
  end
end
