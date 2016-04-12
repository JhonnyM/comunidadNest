class BlogController < ApplicationController
	def index
    @posts = Blog.all.reverse
    render layout: "sidebar_right"
  end

  def show
    @post = Blog.where(:permalink => params[:id]).first
    render layout: "sidebar_right"
  end
end
