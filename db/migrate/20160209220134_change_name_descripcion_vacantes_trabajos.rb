class ChangeNameDescripcionVacantesTrabajos < ActiveRecord::Migration
  def change
  	rename_column :vacantes_trabajos, :desripcion, :descripcion
  end
end
