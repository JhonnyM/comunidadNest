class AddEmpresaIdToLicitacions < ActiveRecord::Migration
  def change
  	add_column :licitacions, :empresa_id, :integer
  end
end
