class CreateIndustrias < ActiveRecord::Migration
  def change
    create_table :industrias do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
