class ProyectosProyectosCategoria < ActiveRecord::Base
  belongs_to :proyecto 
  belongs_to :proyectos_categorias
end
