class AttractionsController < ApplicationController
    before_action :set_attraction, only: [:show, :update, :destroy]

    def index
        @destination=Destination.find_by(id: params[:destination_id])
        if @destination
            @attractions = @destination.attractions
        else
            @attractions = Attraction.all
        end
        render json: @attractions
    end

    def show
        @destination=Destination.find_by(id: params[:destination_id])
        if @destination
            @attractions = @destination.attractions.find_by(id: params[:id])
        else
            @attraction = Attraction.find_by(id: params[:id])
        end
        render json: @attraction
    end

    def create
        @destination=Destination.find_by(id: params[:destination_id])
        if @destination
            @attraction = @destination.attractions.build(attraction_params)
            if @attraction.save
                render json: @attraction
            else
                render json: {error: 'Attraction cannot be created'}
            end
        else
            @attraction = Attraction.new(attraction_params)
            if @attraction.save
                render json: @attraction
            else
                render json: {error: 'Attraction cannot be created'}
            end
        end
    end

    # def update
    #     if @attraction.update(attraction_params)
    #         render json: @attraction
    #     else
    #         render json: @attraction.errors
    #     end
    # end

    def destroy
        if @destination
            @attractions = @destination.attractions.find_by(id: params[:id])
        else
            @attraction = Attraction.find_by(id: params[:id])
        end
        @attraction.destroy
    end

    private

    def set_attraction
        @attraction= Attraction.find_by(id: params[:id])
    end

    def attraction_params
        params.require(:attraction).permit(:name, :description, :destination_id)
    end


end
