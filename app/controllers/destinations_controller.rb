class DestinationsController < ApplicationController

    def index
        @destinations = Destination.all
        render json: @destinations
    end

    def create
        @destination = Destination.new(destination_params)
        if @destination.save
            render json: @destination
        else
            render json: {error: 'Destination cannot be created'}
        end
    end

    def show
        @destination = Destination.find_by(id: params[:id])
        render json: @destination
    end

    def update
        if @destination.update(destination_params)
            render json: @destination
        else
            render json: @destination.errors
        end
    end

    def destroy
        @destination = Destination.find_by(id: params[:id])
        @destination.destroy
    end

    private

    def destination_params
        params.require(:destination).permit(:name, :location, :description)
    end
end
