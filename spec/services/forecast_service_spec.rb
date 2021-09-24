require 'rails_helper'

RSpec.describe 'ForcastService' do
  describe 'get_weather' do
    it 'take an array of [lat, lng] and returns the parsed weather data' do
      forecast_data = ForecastService.get_forecast([39.738453, -104.984853])
      expect().to eq(content)
    end
  end
end