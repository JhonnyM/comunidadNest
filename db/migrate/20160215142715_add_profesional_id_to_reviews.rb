class AddProfesionalIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :profesional_id, :integer
  end
end
