class CreateRecomendados < ActiveRecord::Migration
  def change
    create_table :recomendados do |t|
      t.integer :perfil_id
      t.string :type

      t.timestamps null: false
    end
  end
end
