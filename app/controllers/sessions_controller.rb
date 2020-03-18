class SessionsController < ApplicationController
    skip_before_action :require_login
    
    def new
        @birdwatcher = Birdwatcher.new
    end

    def create
        @birdwatcher = Birdwatcher.find_by(name: login_params[:name])
        if @birdwatcher && @birdwatcher.authenticate(login_params[:password])
            session[:birdwatcher_id] = @birdwatcher.id
            redirect_to birdwatcher_path(@birdwatcher)
        else
            @birdwatcher = Birdwatcher.new(login_params)
            @birdwatcher.valid?
            render :new
        end
    end

    def destroy
        session.destroy
        redirect_to root_path
    end

    def github
        # byebug
        @birdwatcher = Birdwatcher.find_or_create_by(uid: auth[:uid]) do |u|
            u.name = auth['info']['name']
            u.password = SecureRandom.hex
            u.age = 404
        end

        session[:birdwatcher_id] = @birdwatcher.id

        flash[:notice] = "Since you came from GitHub, you should update your personal information"

        redirect_to birdwatcher_path(@birdwatcher)
    end

    private

        def login_params
            params.require(:birdwatcher).permit(:name, :password)
        end

        def auth
            request.env["omniauth.auth"]
        end
end