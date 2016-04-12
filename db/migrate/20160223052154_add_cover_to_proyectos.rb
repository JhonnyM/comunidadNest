class AddCoverToProyectos < ActiveRecord::Migration
  def change
  	add_column :proyectos, :cover, :integer
  end
end