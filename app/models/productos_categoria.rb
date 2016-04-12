class ProductosCategoria < ActiveRecord::Base
	has_many :licitacions
	has_many :productos
end
