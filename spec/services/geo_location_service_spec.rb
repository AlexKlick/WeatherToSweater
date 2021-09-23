require 'rails_helper'

RSpec.describe 'GeoLocationService' do

  before(:each) do  
  end
  describe 'get_coorinates' do
    it 'given a city and state params, calls the mapquest api and returns the lat and long' do
      name = 'denver,co'
      @lat, @lng = GeoLocationService.get_coordinates(name)
      GooglePlacesServices.get_all(name)
      binding.pry
      expect(@lat).to eq(39.738453)
      expect(@lng).to eq(-104.984853)
    end
    #do we want this to only work for valid city,state combos? 
    #what about no city, no state? Should it return the first result or return error?
    it 'given an invalid city' do
      name = 'Okopoko,CO'
      @lat, @lng = GeoLocationService.get_coordinates(name)
    end
  end
end