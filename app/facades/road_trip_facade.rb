module RoadTripFacade

  def self.initialize_road_trip(origin, destination)
    arrival_weather = get_arrival_weather(origin, destination)
    if arrival_weather[1].is_a? Integer
      time = "#{time = arrival_weather[1] / 3600} hours #{arrival_weather[1] % 3600 / 60} minutes"
    else
      time = arrival_weather[1]
    end
    RoadtripSerializer.serialize(origin, destination, arrival_weather, time)
  end

  def self.get_arrival_weather(origin, destination)
    duration = TripTimeServices.get_trip_time(origin, destination)
    if duration == "impossible" 
      ["", duration]
    else
      finish_time = trip_finish_time(duration)
      forecast_data = ForecastFacade.gather_forecast_data(destination)
      hours_rounded = (duration.to_f / 3600).round(0)
      [forecast_data[:hourly][hours_rounded - 1], duration] #returns forecasedata + duration
    end
  end

  def self.find_trip_time(start, ending)
    TripTimeServices.get_trip_time(start, ending)
  end

  def self.trip_finish_time(duration)
    Time.now + duration
  end
end