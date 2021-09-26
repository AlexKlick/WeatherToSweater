module RoadTripFacade
  def self.initialize_road_trip(origin, destination)
    arrival_weather = get_arrival_weather(origin, destination)
    time = Time.at(arrival_weather[1]).utc.strftime("%k hours %M minutes").strip
    serialize = {}
    serialize[:data] = {}
    serialize[:data][:id] = nil
    serialize[:data][:type] = 'roadtrip'
    serialize[:data][:attributes] = {}
    serialize[:data][:attributes][:start_city] = origin
    serialize[:data][:attributes][:end_city] = destination
    serialize[:data][:attributes][:travel_time] = time
    serialize[:data][:attributes][:weather_at_eta] = {}
    serialize[:data][:attributes][:weather_at_eta][:temperature] = arrival_weather[0][:temp]
    serialize[:data][:attributes][:weather_at_eta][:conditions] = arrival_weather[0][:weather][0][:description]
    serialize
  end

  def self.get_arrival_weather(origin, destination)
    duration = TripTimeServices.get_trip_time(origin, destination)
    finish_time = trip_finish_time(duration)
    forecast_data = ForecastFacade.gather_forecast_data(destination)
    hours_rounded = (duration.to_f / 3600).round(0)
    [forecast_data[:hourly][hours_rounded - 1], duration] #returns forecasedata + duration
  end
  def self.find_trip_time(start, ending)
    TripTimeServices.get_trip_time(start, ending)
  end

  def self.trip_finish_time(duration)
    Time.now + duration
  end
end