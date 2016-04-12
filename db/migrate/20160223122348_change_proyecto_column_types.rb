class ChangeProyectoColumnTypes < ActiveRecord::Migration
	def up
    change_column :proyectos, :status_proyecto, :string
    change_column :proyectos, :status, :string
  end

  def down
    change_column :proyectos, :status_proyecto, :integer
    change_column :proyectos, :status, :integer
  end
end
