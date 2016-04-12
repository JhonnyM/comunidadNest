class User < ActiveRecord::Base

  has_one :profesional, dependent: :destroy
  has_many :proyectos, dependent: :destroy
  has_many :empresas, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login


  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  # validates :username,
  #  :presence => true,
  #  :uniqueness => {
  #    :case_sensitive => false
  #  }

  validate :validate_username
  validates_acceptance_of :terms

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end

  rails_admin do
    object_label_method :username
  end

  #Mailboxer

  acts_as_messageable

  def mailboxer_name
    self.nombre
  end

  def mailboxer_email(object)
    self.email
  end

  def valid_password?(password)
    return false if encrypted_password.blank?
    enc = encrypted_password
    enc[0..3] = '$2a$' if encrypted_password[0..3] == '$2y$'
    my_password = BCrypt::Password.new(enc)
    my_password == password
  end
end
