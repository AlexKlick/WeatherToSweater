module ForecastFacade

  def self.initialize_forecast_get(location)
    forecast_data = gather_forecast_data(location)
    prep_data(forecast_data)
  end

  def self.gather_forecast_data(location)
    @lat, @lng = GeoLocationService.get_coordinates(location)
    ForecastService.get_forecast_data(@lat, @lng)
  end

  def self.prep_data(forecast_data)
    ForecastSerializer.serialize(forecast_data)
  end

end