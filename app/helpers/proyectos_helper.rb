module ProyectosHelper

  def find_project_owner(user_id)

    if self.propietario_tipo == 'profesional'
      return Profesional.find(self.propietario_id)
    else
      return Empresa.find(self.propietario_id)
    end
  end
end
