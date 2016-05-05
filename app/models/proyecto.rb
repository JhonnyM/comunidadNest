class Proyecto < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :proyectos_categorias
	has_many :proyecto_imagenes, :dependent => :destroy
	has_many :participante_proyectos, :dependent => :destroy

	attr_accessor :imagenes

	# Validations

	validates :titulo, presence: true
	validates :descripcion, length: { maximum: 400, too_long: "%{count} es el máximo número de palabras permitido"  }
	validates :area, numericality: { only_integer: true }, if: lambda{ |object| object.area.present? }
	validates :fecha, inclusion: { in: 1900..Date.today.year },
						format: {
										with: /(19|20)\d{2}/i,
										message: "Debe contener un año válido"
								}, if: lambda{ |object| object.fecha.present? }

	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks

	# Nested attributes
	accepts_nested_attributes_for :proyecto_imagenes

	#Scopes
  scope :by_categoria, -> categoria { where(:categoria_id == categoria.to_i) }

	extend Enumerize
	enumerize :status_proyecto, in: [:construido, :en_construcción, :anteproyecto, :académico], default: :construido
	enumerize :status, in: [:público, :oculto], default: :público

	rails_admin do
		object_label_method :titulo
	end

	# Methods

	def imagenes=(imagenes)
		imagenes.each{|imagen| proyecto_imagenes.create(imagen: imagen)}
	end

	def self.white_list
		[:titulo, :descripcion, :pais, :ciudad, :area, :fecha, :proyectos_categoria_id, :status_proyecto, :status, :user_id, :propietario_id, :propietario_tipo, :pais]
	end

	def propietario
		if self.propietario_tipo == 'profesional'
			return Profesional.find(self.propietario_id)
		else
			return Empresa.find(self.propietario_id)
		end
	end

	def cover_img
		if self.cover.present?
			ProyectoImagen.find(self.cover).imagen
		else
			proyecto_imagenes.first.try(:imagen)
		end

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