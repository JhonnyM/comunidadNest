class CreateProfesiones < ActiveRecord::Migration
  def change
    create_table :profesiones do |t|
      t.string :generico
      t.string :masculino
      t.string :femenino

      t.timestamps null: false
    end
  end
end
