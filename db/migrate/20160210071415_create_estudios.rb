class CreateEstudios < ActiveRecord::Migration
  def change
    create_table :estudios do |t|
      t.integer :profesional_id
      t.string :institucion
      t.string :titulo
      t.integer :fecha

      t.timestamps null: false
    end
  end
end
