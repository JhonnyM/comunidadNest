class AddColumnsToParticpantesProyectos < ActiveRecord::Migration
  def change
  	add_column :participante_proyectos, :proyecto_id, :integer
  	add_column :participante_proyectos, :type, :string
  	add_column :participante_proyectos, :participante_id, :integer
  	add_column :participante_proyectos, :nombre, :string
  	add_column :participante_proyectos, :rol, :string
  	add_column :participante_proyectos, :autorizado, :string
  end
end
