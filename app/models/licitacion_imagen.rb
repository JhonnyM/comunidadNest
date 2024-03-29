class LicitacionImagen < ActiveRecord::Base
	belongs_to :licitacion
	has_attached_file :imagen,
		styles: { large: "900x900>", thumb: "250x250>" },
		# default_url: "/images/:class/:style/missing.png"
		default_url: ActionController::Base.helpers.asset_path('missing_avatar_empresa.jpg')


	#validates_attachment_content_type :imagen, content_type: /\Aimage\/.*\Z/
  	do_not_validate_attachment_file_type :imagen
end
