module GeoLocationService
  def self.get_coordinates(location_name)
    response = Faraday.get("http://www.mapquestapi.com/geocoding/v1/address?key=#{ENV["map_key"]}&location=#{location_name}")
    result =  Oj.load(response.body, :symbol_keys => true)
    latLng = result[:results][0][:locations][0][:latLng]
    [latLng[:lat], latLng[:lng]]  #returns destructured lat, lng
  end
end