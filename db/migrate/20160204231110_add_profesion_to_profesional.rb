class AddProfesionToProfesional < ActiveRecord::Migration
  def change
  	add_column :profesionales, :profesion_id, :integer
  end
end
