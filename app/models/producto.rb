class Producto < ActiveRecord::Base
	belongs_to :productos_categoria
	has_many :producto_imagenes, :dependent => :destroy
	
	rails_admin do
		object_label_method :titulo
	end
end
