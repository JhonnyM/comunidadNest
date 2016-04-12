class EmpleadosEmpresa < ActiveRecord::Base
	belongs_to :empresa
	belongs_to :profesional

	def nombre_empleado
		self.profesional.nombre
	end

	rails_admin do
		object_label_method :nombre_empleado
	end

	def estados
    [['Pendiente'], ['Autorizado'] , ['Rechazado']]
  end

	def estado_actual
		estados[self.status]
	end

	scope :autorizado, -> { where(status: 1) }
	scope :pendiente, -> { where(status: 0) }

	def autorizar!
	  self.update_attribute(:status, 1)
	end
end
