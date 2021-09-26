module PictureServices
  
  # def self.get_geo_and_photo(location) #takes in location, returns **geometry if they let me** and photo reference
  #   location = location.gsub(',', '%2C')
  #   url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?fields=formatted_address%2Cgeometry%2Cphotos&"
  #   places_data = Faraday.get("#{url}input=#{location}&inputtype=textquery&key=#{ENV["places_key"]}")
  #   place = JSON.parse(places_data.body, symbolize_names: true)
  #   place[:candidates][0][:photos][0][:photo_reference] #returns only photo currently
  # end

  def self.get_autocompleted(location)
    response = Faraday.get("https://maps.googleapis.com/maps/api/place/autocomplete/json?input=#{location}&key=#{ENV["places_key"]}")
    parsed = JSON.parse(response.body, symbolize_names: true)
    parsed[:predictions][0][:place_id]
  end
  
  def self.get_photos_ref(place_id)
    response = Faraday.get("https://maps.googleapis.com/maps/api/place/details/json?fields=photo&place_id=#{place_id}&key=#{ENV["places_key"]}")
    parsed = JSON.parse(response.body, symbolize_names: true)
    photos = parsed[:result][:photos]
    photos[rand(0..photos.length-1)][:photo_reference] #returns a random photo from the city
  end

  def self.get_photo(photo_reference) #takes reference, returns photo url
    response = Faraday.get("https://maps.googleapis.com/maps/api/place/photo?maxwidth=800&photo_reference=#{photo_reference}&key=#{ENV["places_key"]}")
    response.headers['location']
  end
  #refactor to facade
end