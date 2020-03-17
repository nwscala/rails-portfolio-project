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
            redirect_to new_birdwatcher_path
        end
    end

    private

        def birdwatcher_params
            params.require(:birdwatcher).permit(:name, :password, :age, :ornithologist)
        end
end
