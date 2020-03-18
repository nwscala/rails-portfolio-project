class BirdwatchersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    before_action :set_birdwatcher, except: [:index, :new, :create]
    
    def index
        @birdwatchers = Birdwatcher.all
    end

    def new
        @birdwatcher = Birdwatcher.new
    end

    def create
        @birdwatcher = Birdwatcher.new(birdwatcher_params)
        if @birdwatcher.valid?
            @birdwatcher.save
            session[:birdwatcher_id] = @birdwatcher.id
            redirect_to birdwatcher_path(@birdwatcher)
        else
            render :new
        end
    end

    def edit
        
    end

    def update
        if @birdwatcher.update(birdwatcher_params)
            redirect_to birdwatcher_path(@birdwatcher)
        else
            render :edit
        end
    end

    def show
        
    end

    def destroy
        if current_user == @birdwatcher
            @birdwatcher.destroy
            session.destroy
            redirect_to root_path
        else
            flash[:notice] = "You cannot delete this account since you are not its owner."
            redirect_to root_path
        end
    end

    private

        def birdwatcher_params
            params.require(:birdwatcher).permit(:name, :password, :age, :ornithologist)
        end

        def set_birdwatcher
            @birdwatcher = Birdwatcher.find(params[:id])
        end
end
