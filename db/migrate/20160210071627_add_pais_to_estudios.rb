class AddPaisToEstudios < ActiveRecord::Migration
  def change
  	add_column :estudios, :pais, :string
  end
end
