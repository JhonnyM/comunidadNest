class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :titulo
      t.string :titulo_bold
      t.string :autor
      t.string :pais

      t.timestamps null: false
    end
  end
end
