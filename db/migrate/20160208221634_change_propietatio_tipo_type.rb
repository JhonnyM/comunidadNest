class ChangePropietatioTipoType < ActiveRecord::Migration
  def change
  	change_column :proyectos, :propietario_tipo, :string
  end
end
