module ForecastService
  def self.get_forecast_data(lat, lng)
    response = Faraday.get("https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{lng}&units=imperial&exclude=minutely,alerts&appid=#{ENV["weather_key"]}")
    Oj.load(response.body, :symbol_keys => true)
  end
end