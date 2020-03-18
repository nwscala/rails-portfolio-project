class BirdsController < ApplicationController
    before_action :is_ornithologist?, except: [:index, :show]
    before_action :set_bird, except: [:index, :new, :create]
    
    def index
        @birds = Bird.all
    end

    def new
        @bird = Bird.new
    end

    def create
        @bird = Bird.new(bird_params)
    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

        def bird_params
            require
        end

        def set_bird
            @bird = Bird.find_by_id(params[:id])
        end
end
