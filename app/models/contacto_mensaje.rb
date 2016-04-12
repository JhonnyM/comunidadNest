class ContactoMensaje

  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :nombre, :email, :asunto, :mensaje

  validates :nombre, presence: true
  validates :email, presence: true
  validates :asunto, presence: true
  validates :mensaje, presence: true
  validates_format_of :email,:with => Devise::email_regexp

end
