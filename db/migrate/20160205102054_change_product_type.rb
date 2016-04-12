class ChangeProductType < ActiveRecord::Migration
  def change
  	rename_column :productos, :product_type_id, :productos_categoria_id
  	rename_column :licitacions, :producto_categoria_id, :productos_categoria_id
  end
end
