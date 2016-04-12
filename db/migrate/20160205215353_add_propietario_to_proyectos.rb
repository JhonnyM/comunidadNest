class AddPropietarioToProyectos < ActiveRecord::Migration
  def change
  	add_column :proyectos, :propietario_id, :integer
  	add_column :proyectos, :propietario_tipo, :integer
  end
end
