class CreateLicitacions < ActiveRecord::Migration
  def change
    create_table :licitacions do |t|
      t.string :titulo
      t.string :pais
      t.integer :cantidad
      t.string :unidad_medida
      t.integer :producto_categoria_id
      t.text :especificaciones
      t.integer :precio_minimo
      t.integer :precio_maximo
      t.string :tipo_de_cambio
      t.date :entrega
      t.date :plazo
      t.text :observaciones

      t.timestamps null: false
    end
  end
end
