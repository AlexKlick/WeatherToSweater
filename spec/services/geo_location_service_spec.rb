require 'rails_helper'

RSpec.describe 'GeoLocationService' do

  before(:each) do  
    name = 'Denver,CO'
    @lat, @long = GeoLocationService.get_coorinates(name)
  end
  describe 'get_coorinates' do
    it 'given a city and state params, calls the mapquest api and returns the lat and long' do
      binding.pry
    end
  end
end