class ProyectoImagen < ActiveRecord::Base
	belongs_to :proyecto

	has_attached_file :imagen,
		path: ":rails_root/public/system/:attachment/:id/:style/:filename",
		url: "/system/:attachment/:id/:style/:filename",
		styles: { large: "900x900>", medium: "500x500>", thumb: "250x250#" },
    convert_options: {:thumb => "-quality 75 -strip" },
		default_url:  ActionController::Base.helpers.asset_path('missing_avatar_empresa.jpg')

  	#validates_attachment_content_type :imagen, content_type: /\Aimage\/.*\Z/
  	do_not_validate_attachment_file_type :imagen
end
