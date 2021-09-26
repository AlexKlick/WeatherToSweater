module TripTimeServices
  def self.get_trip_time(start, ending)
    start = start.gsub(',', '%2C+')
    start = start.gsub(' ', '+')
    ending = ending.gsub(',', '%2C+')
    ending = ending.gsub(' ', '+')
    trip_data = Faraday.get("https://www.mapquestapi.com/directions/v2/route?key=#{ENV['map_key']}&from=#{start}&to=#{ending}&outFormat=json&ambiguities=ignore&routeType=fastest&doReverseGeocode=false&enhancedNarrative=false&avoidTimedConditions=false")
    data = JSON.parse(trip_data.body, symbolize_names: true)
    data[:route][:realTime]
  end
end