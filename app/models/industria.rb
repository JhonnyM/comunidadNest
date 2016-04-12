class Industria < ActiveRecord::Base
	has_many :empresas

	def counter
		Empresa.where("industria_id = ?", id).count
	end

	rails_admin do
		object_label_method :nombre
	end
end
