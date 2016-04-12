module ApplicationHelper
	def current_class?(test_path)
		if params[:controller] == 'static_pages'
			return 'current active' if request.path == test_path
		else
			return 'current active' if params[:controller] == test_path
		end
	end

	def active_page(active_page)
    @active == active_page ? "active" : ""
  end
end
