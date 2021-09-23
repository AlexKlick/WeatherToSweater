require 'rails_helper'

RSpec.describe 'WeatherService' do
  describe 'get_weather' do
    it 'take an array of [lat, lng] and returns the parsed weather data' do
      weather_data = WeatherService.get_forecast([39.738453, -104.984853])
      expect().to eq(content)
    end
  end
end