class CreateCutomParticipante < ActiveRecord::Migration
  def change
    create_table :cutom_participantes do |t|
    	t.integer "proyecto_id"
    	t.string "tipo"
    	t.string "nombre"
    	t.string "rol"
    	t.integer "auorizado"
    	t.timestamps null: false
    end
  end
end
