class Api::V1::ForecastController < ApplicationController
  def index
    forecast_data = ForecastFacade.initialize_forecast_get(params[:location])
    render json: forecast_data
  end
end