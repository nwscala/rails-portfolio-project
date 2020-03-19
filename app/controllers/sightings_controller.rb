class SightingsController < ApplicationController
    before_action :birdwatcher_check
    before_action :clean_sightings
    before_action :set_sighting, except: [:index, :new, :create]

    def index
        if params[:birdwatcher_id]
            @sightings = @birdwatcher.sightings
        else
            @sightings = Sighting.all
        end
    end
    
    def new
        @sighting = current_user.sightings.build
    end

    def create
        @sighting = current_user.sightings.build(sighting_params)
        if @sighting.save
            redirect_to sightings_path
        else
            render :new
        end
    end

    def show 

    end

    def edit
        if current_user != @birdwatcher
            flash[:notice] = "You cannot edit someone else's sighting!"
            redirect_to root_path
        end
    end

    def update
        if @sighting.update(sighting_params)
            redirect_to birdwatcher_sighting_path(@birdwatcher, @sighting)
        else    
            render :edit
        end
    end

    def delete
        if current_user == @birdwatcher
            @sighting.destroy
            redirect_to sightings_path
        else
            flash[:notice] = "You cannot delete someone else's sighting!"
            redirect_to root_path
        end
    end

    private

        def sighting_params
            params.require(:sighting).permit(:bird_id, :location, :time_of_day, :time_of_year)
        end

        def birdwatcher_check
            if params[:birdwatcher_id]
                @birdwatcher = Birdwatcher.find_by_id(params[:birdwatcher_id])
                if !@birdwatcher
                    flash[:notice] = "It seems like that birdwatcher isn't in our database."
                    redirect_to root_path
                end
            end
        end

        def set_sighting
            @sighting = Sighting.find_by_id(params[:id])
            if !@sighting
                flash[:notice] = "It seems like there isn't a sighting with that id in our database."
                redirect_to root_path
            end
        end

        def clean_sightings
            Sighting.all.each do |sighting|
                if !sighting.birdwatcher
                    sighting.destroy
                end
            end
        end
end
