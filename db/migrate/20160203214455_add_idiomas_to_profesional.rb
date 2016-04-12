class AddIdiomasToProfesional < ActiveRecord::Migration
  def change
  	add_column :profesionales, :idiomas, :text
  end
end
