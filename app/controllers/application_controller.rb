class ApplicationController < ActionController::Base
  
  private #------------
	
	def authorize_access
	  if !session[:user_id]
	    flash[:notice] = "Please log in."
	    redirect_to(:controller => 'sessions', :action => 'new')
	    return false
	  end	
	end

	private
	def current_user
		@corrent_user ||=User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_user
end
