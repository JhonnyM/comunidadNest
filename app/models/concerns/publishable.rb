module Publishable
  extend ActiveSupport::Concern

  module ClassMethods
    def is_published?
      return true if self.status == 1
    end
  end
end