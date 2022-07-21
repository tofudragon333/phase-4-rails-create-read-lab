class PlantsController < ApplicationController

    # GET/ plants
    def index
        plants = Plant.all
        render json: plants
    end

    # GET/ plants/:id
    def show
        plant = Plant.find_by(params[:id])
        if plant
            render json: plant, status: :found
        else
            render json: {error: "Couldn't find plant"}, status: :not_found
        end
    end

    def create
        plant = Plant.create(strong_params)
        render json: plant, status: :created
    end

    private
    def strong_params
        params.permit(:id, :name, :image, :price)
    end
end
