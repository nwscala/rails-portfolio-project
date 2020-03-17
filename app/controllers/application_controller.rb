class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user

    def logged_in?
        !!session[:birdwatcher_id]
    end

    def current_user
        Birdwatcher.find_by_id(session[:birdwatcher_id])
    end
    
    def require_login
        unless logged_in?
            flash[:notice] = "You must sign up or login to access that page."
            redirect_to root_path
        end
    end
end
