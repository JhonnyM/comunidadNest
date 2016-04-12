class ProductoImagen < ActiveRecord::Base
	belongs_to :producto

	has_attached_file :imagen, 
		styles: { large: "900x900>", thumb: "250x250>" },
		:url => "/system/:class/:attachment/:id/:style/:basename.:extension",
  		:path => ":rails_root/public/system/:class/:attachment/:id/:style/:basename.:extension",
		# default_url: "/images/:class/:style/missing.png"
		default_url: ActionController::Base.helpers.asset_path('missing_avatar_empresa.jpg')

  	#validates_attachment_content_type :imagen, content_type: /\Aimage\/.*\Z/
  	do_not_validate_attachment_file_type :imagen
end
