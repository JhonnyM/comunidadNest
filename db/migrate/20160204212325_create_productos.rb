class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :titulo
      t.integer :propietario_id
      t.integer :propietario_tipo
      t.integer :product_type_id
      t.string :materiales
      t.string :diseñador
      t.string :codigo
      t.string :pais
      t.text :descripcion

      t.timestamps null: false
    end
  end
end
