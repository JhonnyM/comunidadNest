class Licitacion < ActiveRecord::Base
	belongs_to :productos_categoria
	belongs_to :empresa
	has_many :licitacion_imagenes, :dependent => :destroy

	has_attached_file :documento
	validates_attachment :documento, 
	:content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

	def unidades
    [['m'], ['m2'], ['cm']]
  end

  def currencies
    [['USD'], ['CRC']]
  end

end
