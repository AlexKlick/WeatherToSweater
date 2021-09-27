module BookSearchFacade
  def self.get_forecast(location)
    ForecastFacade.gather_forecast_data(location)
  end
end