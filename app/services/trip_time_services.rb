module TripTimeServices
  def self.get_trip_time(start, ending)
    start = start.gsub(',', '%2C+')
    start = start.gsub(' ', '+')
    ending = ending.gsub(',', '%2C+')
    ending = ending.gsub(' ', '+')
    trip_data = Faraday.get("https://www.mapquestapi.com/directions/v2/route?key=#{ENV['map_key']}&from=#{start}&to=l#{ending}&outFormat=json&ambiguities=ignore&routeType=fastest&doReverseGeocode=false&enhancedNarrative=false&avoidTimedConditions=false")
    data = JSON.parse(trip_data.body, symbolize_names: true)
    if data[:route][:routeError][:errorCode] != -400
      "impossible"
    else
      #was originally using realTime, but was getting a response from multiple cities that said 2777 hours travel time.
      #using formattedTime converting to seconds
      formatted_time_array = data[:route][:formattedTime].split(":").map(&:to_i) # [hour, minute, second]
      formatted_time_array[0] * 3600 + formatted_time_array[1] * 60 + formatted_time_array[2]
    end
  end
end
