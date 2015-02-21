module ApplicationHelper
	def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

   def youtube_video(url)
    render :partial => 'shared/video', :locals => { :url => url }
  end 
end
