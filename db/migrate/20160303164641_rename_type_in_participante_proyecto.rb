class RenameTypeInParticipanteProyecto < ActiveRecord::Migration
  def change
    rename_column :participante_proyectos, :type, :participante_type 
  end
end
