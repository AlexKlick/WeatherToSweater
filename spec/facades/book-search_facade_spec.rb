require 'rails_helper'

RSpec.describe 'BookSearchFacade' do
  describe 'get_forecast(location)' do
    it 'takes in a location and returns the current forecast data for that location' do
      location = 'Detroit,MI'
      forecast = BookSearchFacade.get_forecast(location)
      expect(forecast[:timezone]).to eq("America/Detroit")
      expect(forecast[:current]).to be_a(Hash)
      expect(forecast[:current][:temp]).to be_a(Float)
      expect(forecast[:current][:weather]).to be_a(Array)
      expect(forecast[:current][:weather][0][:description]).to be_a(String)
    end
  end
end