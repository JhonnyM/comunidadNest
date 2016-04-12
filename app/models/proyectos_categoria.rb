class ProyectosCategoria < ActiveRecord::Base
	has_and_belongs_to_many :proyectos
	
	rails_admin do
		object_label_method :nombre
	end
end
