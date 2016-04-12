class RemoveProfesionalFromReview < ActiveRecord::Migration
  def change
    remove_reference :reviews, :profesional, index: true
  end
end
