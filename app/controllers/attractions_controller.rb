class AttractionsController < ApplicationController

    def index
        @attractions = Attraction.all
        render json: @attractions
    end

    def show
        @attraction = Attraction.find_by(id: params[:id])
        render json: @attraction
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            render json: @attraction
        else
            render json: {error: 'Attraction cannot be created'}
        end
    end

    def update
        if @attraction.update(attraction_params)
            render json: @attraction
        else
            render json: @attraction.errors
        end
    end

    def destroy
        @attraction = Attraction.find_by(id: params[:id])
        @attraction.destroy
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :description, :destination_id)
    end


end
