class ChangePropietarioTipoTypeInProductos < ActiveRecord::Migration
  def change
  	change_column :productos, :propietario_tipo, :string
  end
end
