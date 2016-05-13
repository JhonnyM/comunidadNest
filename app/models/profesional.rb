require 'elasticsearch/model'

class Profesional < ActiveRecord::Base
	include Reviewable

	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks

	belongs_to :user
	belongs_to :profesion, :inverse_of => :profesionales
	has_many :empleados_empresas
	has_many :experiencias
	has_many :estudios

	has_attached_file :avatar, styles: { medium: "250x250>", thumb: "100x100>" },
										default_url: ActionController::Base.helpers.asset_path('missing_avatar_empresa.jpg')

	validates_attachment :avatar, presence: true,
  content_type: { content_type: /\Aimage\/.*\Z/ }, size: { in: 0..1000.kilobytes }

	has_attached_file :page_img,
	styles: { default: "800x800>"},
	default_url: ActionController::Base.helpers.asset_path('missing_avatar.png')
	validates_attachment :page_img,
  content_type: { content_type: /\Aimage\/.*\Z/ }, size: { in: 0..2000.kilobytes }

	has_attached_file :curriculum
	validates_attachment :curriculum,
	:content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) },
	size: { in: 0..3000.kilobytes }

	has_attached_file :portafolio
	validates_attachment :portafolio,
	:content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) },
	size: { in: 0..4000.kilobytes }

	acts_as_taggable # Alias for acts_as_taggable_on :tags

	serialize :idiomas, Array

	#Validaciones
	validates_presence_of :genero, :user_id, :email, :profesion_id, :pais, :nombre
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :nombre, length: { maximum: 40 }

	def estados_civiles
    [['Soltero(a)', 0], ['Casado(a)', 2], ['Divorciado(a)', 0], ['Unión Libre', 2]]
  end

  def generos
  	[['Masculino', 0], ['Femenino', 1]]
  end

	def nombre_profesion
		case self.genero # a_variable is the variable we want to compare
		when 0    #compare to 1
		  return self.profesion.masculino
		when 1    #compare to 2
		  return self.profesion.femenino
		else
		  return self.profesion.generico
		end
	end

	def nombre
  	return self.user.nombre if self.user
		return nombre if nombre
		''
  end

  def estado_civil_formateado
  	estados_civiles_genero = {
			0 => { 0 => 'Soltero', 1 => 'Soltera'},
      1 => { 0 => 'Casado', 1 => 'Casada' },
      2 => { 0 => 'Divorciado', 1 => 'Divorciada' },
      3 => { 0 => 'Unión Libre', 1 => 'Unión Libre'}
    }
  	return estados_civiles_genero[self.estado_civil][self.genero]
  	#return self.genero
  end

	rails_admin do
		object_label_method :nombre
	end

	def idiomas_string
		self.idiomas.reject(&:blank?).join(', ').titleize
	end

	def country_name
    country = ISO3166::Country[pais]
    country.translations[I18n.locale.to_s] || country.name
  end

  def is_owner? (user)
		user && ( self.user_id == user.id )
  end

  def es_recomendado?
  	if ProfesionalRecomendado.where(:perfil_id => self.id).exists?
		  return true
		else
			if self.avg_rating > 4 and self.reviews.length > 4
				return true
			else
		  	return false
		  end
		end
  end

  def proyectos
  	Proyecto.where(propietario_id: self.id).where(propietario_tipo: 'profesional')
  end

	def self.search(query)
	__elasticsearch__.search(
			{
					query: {
							multi_match: {
									query: query,
									fields: ['nombre', 'especialidades', 'pais', 'ciudad' ]
							}
					}
			}
	)
	end
end

# Delete the previous articles index in Elasticsearch
Profesional.__elasticsearch__.client.indices.delete index: Profesional.index_name rescue nil

# Create the new index with the new mapping
Profesional.__elasticsearch__.client.indices.create \
  index: Profesional.index_name,
	body: { settings: Profesional.settings.to_hash, mappings: Profesional.mappings.to_hash }

Profesional.import force: true
