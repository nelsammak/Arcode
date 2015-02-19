module ApplicationHelper
	def redirect_user
		redirect_to root_path and return if not logged_in?
	end
end
