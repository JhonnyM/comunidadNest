class AddColumnsToBlogs < ActiveRecord::Migration
  def change
  	add_column :blogs, :title, :string
  	add_column :blogs, :alias, :string
  	add_column :blogs, :introtext, :text
  	add_column :blogs, :fulltext, :text
  	add_column :blogs, :metakey, :string
  	add_column :blogs, :metadesc, :string
  	add_column :blogs, :publish_up, :datetime
  	add_attachment :blogs, :image_intro
  	add_attachment :blogs, :image_fulltext
  end
end
