class CreateProductosCategorias < ActiveRecord::Migration
  def change
    create_table :productos_categorias do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
