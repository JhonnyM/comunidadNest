class AddFilesToProfesionales < ActiveRecord::Migration
  def up
    add_attachment :profesionales, :avatar
    add_attachment :profesionales, :page_img
    add_attachment :profesionales, :curriculum
    add_attachment :profesionales, :portafolio
  end

  def down
    remove_attachment :profesionales, :avatar
    remove_attachment :profesionales, :page_img
    remove_attachment :profesionales, :curriculum
    remove_attachment :profesionales, :portafolio
  end
end
