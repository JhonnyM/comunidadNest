class CreateParticipanteProyectos < ActiveRecord::Migration
  def change
    create_table :participante_proyectos do |t|

      t.timestamps null: false
    end
  end
end
