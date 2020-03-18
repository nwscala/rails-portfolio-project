class StaticController < ApplicationController
    skip_before_action :require_login
    
    def home
        # this is the home action
    end
end