class Blog < ActiveRecord::Base
  acts_as_taggable
  has_attached_file :image_intro
  validates_attachment_content_type :image_intro, content_type: /\Aimage\/.*\Z/
  has_attached_file :image_fulltext
  validates_attachment_content_type :image_fulltext, content_type: /\Aimage\/.*\Z/

  alias_attribute :permalink, :alias
  #include Publishable

  scope :published, -> { where(status: 1) }

  def to_param
	  permalink.parameterize
	end

	def next
    Blog.where("id > ?", id).first
  end

  def prev
    Blog.where("id < ?", id).last
  end

  def is_published?
    self.status == 1
  end
end
