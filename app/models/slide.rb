class Slide < ActiveRecord::Base

	has_attached_file :imagen, styles: { large: "1440x384>", medium: "273>", small: "800x213>" },
										# default_url: "/images/:model/:style/missing.png"
										default_url: ActionController::Base.helpers.asset_path('missing_avatar_empresa.jpg')
	validates_attachment_content_type :imagen, content_type: /\Aimage\/.*\Z/


	extend Enumerize
	enumerize :status, in: [:publico, :oculto], default: :publico, scope: :having_status

end
