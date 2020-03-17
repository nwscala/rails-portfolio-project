class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user

    def logged_in?
        !!session[:birdwatcher_id]
    end

    def current_user
        Birdwatcher.find_by_id(params[:birdwatcher_id])
    end
    
end
