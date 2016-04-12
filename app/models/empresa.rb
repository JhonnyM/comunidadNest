class Empresa < ActiveRecord::Base
	include Reviewable
	include Filterable

	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks

	belongs_to :industria
	belongs_to :user
	has_many :empleados_empresas
	has_many :vacantes_trabajos
	has_many :licitacions

	has_attached_file :avatar,
		styles: { medium: "250x250>", thumb: "100x100>" },
		default_url: ActionController::Base.helpers.asset_path('missing_avatar_empresa.jpg')
  	validates_attachment :avatar, presence: true,
	  content_type: { content_type: /\Aimage\/.*\Z/ },
	  size: { in: 0..2000.kilobytes }
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  	has_attached_file :page_img,
		styles: { default: "800x800>"},
		default_url: ActionController::Base.helpers.asset_path("missing_avatar_empresa.jpg")
  	validates_attachment_content_type :page_img, content_type: /\Aimage\/.*\Z/

  has_attached_file :portafolio

	validates_attachment :portafolio,
	:content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

	acts_as_taggable

	#Scopes
  scope :industria, -> (industria_id) { where industria_id: industria_id }
  scope :pais, -> (pais_id) { where pais_id: pais_id }

  #Validaciones
	validates_presence_of :nombre, :user_id, :email, :industria_id, :pais, :descripcion
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

	rails_admin do
		object_label_method :nombre
	end

	def country_name
    country = ISO3166::Country[pais]
    country.translations[I18n.locale.to_s] || country.name
  end

  def proyectos
  	Proyecto.where(propietario_id: self.id).where(propietario_tipo: 'empresa')
	end

	def self.search(query)
		__elasticsearch__.search(
				{
						query: {
								multi_match: {
										query: query,
										fields: ['nombre', 'especialidades', 'pais', 'ciudad' ]
								}
						},
				}
		)
	end

  def is_owner? (user)
  	if user.user_signed_in?
  		user && ( self.user_id == user.id )
  	end
  end

  #scope :with_avatar, where.not(avatar: :nil)

end
# Delete the previous articles index in Elasticsearch
Empresa.__elasticsearch__.client.indices.delete index: Empresa.index_name rescue nil

# Create the new index with the new mapping
Empresa.__elasticsearch__.client.indices.create \
  index: Empresa.index_name,
	body: { settings: Empresa.settings.to_hash, mappings: Empresa.mappings.to_hash }

Empresa.import force: true
