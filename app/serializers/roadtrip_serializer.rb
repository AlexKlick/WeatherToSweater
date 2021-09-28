module RoadtripSerializer
  def self.serialize(origin, destination, arrival_weather, time)
    serialize = {}
    serialize[:data] = {}
    serialize[:data][:id] = nil
    serialize[:data][:type] = 'roadtrip'
    serialize[:data][:attributes] = {}
    serialize[:data][:attributes][:start_city] = origin
    serialize[:data][:attributes][:end_city] = destination
    serialize[:data][:attributes][:travel_time] = time
    serialize[:data][:attributes][:weather_at_eta] = {}
    if arrival_weather[0] != ""
      serialize[:data][:attributes][:weather_at_eta][:temperature] = arrival_weather[0][:temp]
      serialize[:data][:attributes][:weather_at_eta][:conditions] = arrival_weather[0][:weather][0][:description]
    end
    Oj.dump(serialize)
  end
end