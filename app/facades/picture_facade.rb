module PictureFacade
  def self.get_picture_url(location) #returns picture url string
    place_id = PictureServices.get_autocompleted(location)
    photo_reference = PictureServices.get_photos_ref(place_id)
    PictureServices.get_photo(photo_reference)
  end

  def self.initialize_background_phtoto(location)
    picture = get_picture_url(location)
    PictureSerializer.serialize(picture, location)
  end
end