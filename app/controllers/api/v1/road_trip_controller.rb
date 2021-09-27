class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: trip_params[:api_key])
    if user
      trip = RoadTripFacade.initialize_road_trip(params[:origin], params[:destination])
      render json: trip.to_json
    else
      message = "Invalid api key"
      render json: message.to_json, status: 401
    end
  end

  
  private

  def trip_params
    params.require(:road_trip).permit(:destination, :origin, :api_key)
  end
end
