class BirdwatchersController < ApplicationController
    
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
        @birdwatcher = Birdwatcher.find(params[:id])
    end

    def update
        @birdwatcher = Birdwatcher.find(params[:id])
        if @birdwatcher.update(birdwatcher_params)
            redirect_to birdwatcher_path(@birdwatcher)
        else
            render :edit
        end
    end

    def show
        @birdwatcher = Birdwatcher.find(params[:id])
    end

    private

        def birdwatcher_params
            params.require(:birdwatcher).permit(:name, :password, :age, :ornithologist)
        end
end
