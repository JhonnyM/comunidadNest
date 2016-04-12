class CreateEducaciones < ActiveRecord::Migration
  def change
    create_table :educaciones do |t|
      t.integer :profesional_id
      t.string :institucion
      t.string :titulo
      t.string :fecha
      t.string :pais

      t.timestamps null: false
    end
  end
end
