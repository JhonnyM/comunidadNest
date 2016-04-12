class ChangePaisColumnType < ActiveRecord::Migration
  def up
    change_column :profesionales, :pais, :string
  end

  def down
    change_column :profesionales, :pais, :integer
  end
end
