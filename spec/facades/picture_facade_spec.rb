require 'rails_helper'

RSpec.describe 'Picture Facade' do
  describe 'get_picture_url(location)' do
    it 'receives city, state params, returns a picture url from that city' do
      picture = PictureFacade.get_picture_url("Denver, Co")
      #check it returns string, url that is https, google places image hosted
      expect(picture).to be_a(String)
      uri = URI.parse(picture)
      expect(uri.scheme ).to eq("https")
      expect(uri.host).to eq("lh3.googleusercontent.com")
      expect(uri.path[0..7] ).to eq('/places/')

      #test that the places id returns the correct city
      #don't currently have a method to output the city from picture_reference
    end
  end
end