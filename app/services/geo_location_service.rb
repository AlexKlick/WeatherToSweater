module GeoLocationService
  def self.get_coordinates(location_name)
    response = Faraday.get("http://www.mapquestapi.com/geocoding/v1/address?key=#{ENV["map_key"]}&location=#{location_name}")
    result = JSON.parse(response.body, symbolize_names: true)
    latLng = result[:results][0][:locations][0][:latLng]
    [latLng[:lat], latLng[:lng]]  #returns destructured lat, lng
  end
end