class Proyecto < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :proyectos_categorias
	has_many :proyecto_imagenes, :dependent => :destroy
	has_many :participante_proyectos, :dependent => :destroy

	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks

	#Scopes
  scope :by_categoria, -> categoria { where(:categoria_id == categoria.to_i) }

	extend Enumerize
	enumerize :status_proyecto, in: [:construido, :en_construccion, :anteproyecto, :academico], default: :construido
	enumerize :status, in: [:publico, :oculto], default: :publico

	rails_admin do
		object_label_method :titulo
	end

	def propietario
		if self.propietario_tipo == 'profesional'
			return Profesional.find(self.propietario_id)
		else
			return Empresa.find(self.propietario_id)
		end
	end

	def cover_img
		ProyectoImagen.find(self.cover).imagen
	end

	def country_name
    country = ISO3166::Country[pais]
    country.translations[I18n.locale.to_s] || country.name
  end

  #Scopes
  scope :categoria, -> (categoria_id) { where categoria_id: categoria_id }
  scope :pais, -> (pais_id) { where pais_id: pais_id }

	def self.search(query)
		__elasticsearch__.search(
				{
						query: {
								multi_match: {
										query: query,
										fields: ['titulo', 'propietario_tipo', 'pais', 'ciudad' ]
								}
						}
				}
		)
	end
end


# Delete the previous articles index in Elasticsearch
Proyecto.__elasticsearch__.client.indices.delete index: Proyecto.index_name rescue nil

# Create the new index with the new mapping
Proyecto.__elasticsearch__.client.indices.create \
  index: Proyecto.index_name,
	body: { settings: Proyecto.settings.to_hash, mappings: Proyecto.mappings.to_hash }

Proyecto.import force: true