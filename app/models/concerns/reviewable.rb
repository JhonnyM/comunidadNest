module Reviewable
  extend ActiveSupport::Concern

  included do
    has_many :reviews, as: :reviewable
  end

  def avg_rating
  	if self.reviews.blank?
      return 0
    else
      return self.reviews.average(:rating).round(2)
    end
  end

  def reviewable_by? user
    user && !self.reviews.find_by(user_id: user.id)
  end
end
