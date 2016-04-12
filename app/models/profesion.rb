class Profesion < ActiveRecord::Base
	has_many :profesionales, :inverse_of => :profesion

	def counter
		Profesional.where("profesion_id = ?", id).count
	end

	rails_admin do
		object_label_method :generico
	end
end