class AddStatusToSlides < ActiveRecord::Migration
  def change
  	add_column :slides, :status, :string
  end
end
