class Estudio < ActiveRecord::Base
	belongs_to :profesional

  validates :titulo, :institucion, :titulo, :pais, :fecha, presence: true

	def country_name
    country = ISO3166::Country[pais]
    country.translations[I18n.locale.to_s] || country.name
  end
end
