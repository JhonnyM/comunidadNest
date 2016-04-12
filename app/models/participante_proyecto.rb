class ParticipanteProyecto < ActiveRecord::Base
	belongs_to :proyecto

	extend Enumerize
	enumerize :participante_type, in: [:Profesional, :Empresa]
end
