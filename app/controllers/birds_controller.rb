class BirdsController < ApplicationController
    before_action :is_ornithologist?, except: [:index, :show]
    before_action :set_bird, except: [:index, :new, :create]
    
    def index
        if params[:search]
            @birds = Bird.all.where(common_name: params[:search].capitalize)
        else
            @birds = Bird.all
        end
    end

    def new
        @bird = Bird.new
    end

    def create
        @bird = Bird.new(bird_params)
        if @bird.save
            redirect_to bird_path(@bird)
        else
            render :new
        end
    end

    def edit

    end

    def update
        if @bird.update(bird_params)
            redirect_to bird_path(@bird)
        else
            render :edit
        end
    end

    def destroy
        @bird.destroy
        redirect_to birds_path
    end

    private

        def bird_params
            params.require(:bird).permit(:common_name, :scientific_name, :conservation_status)
        end

        def set_bird
            @bird = Bird.find_by_id(params[:id])
        end
end
