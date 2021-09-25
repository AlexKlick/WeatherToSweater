require 'rails_helper'

RSpec.describe 'ForcastService' do
  describe 'get_weather' do
    it 'take an array of [lat, lng] and returns the parsed weather data' do
      @lat, @lng = GeoLocationService.get_coordinates('Denver, CO')
      forecast_data = ForecastService.get_forecast_data(@lat, @lng)
      # datetime
      # sunrise
      # sunset
      # temperature
      # feels_like
      # humidity
      # uvi
      # visibility
      # conditions
      # icon
      expect(forecast_data).to be_a(Hash)

      expect(forecast_data[:current]).to be_a(Hash)
      expect(forecast_data[:current][:dt]).to be_a(Integer)
      expect(forecast_data[:current][:sunrise]).to be_a(Integer)
      expect(forecast_data[:current][:sunset]).to be_a(Integer)
      expect(forecast_data[:current][:temp]).to be_a(Float)
      expect(forecast_data[:current][:feels_like]).to be_a(Float)
      expect(forecast_data[:current][:humidity]).to be_a(Integer)
      expect(forecast_data[:current][:uvi]).to be_a(Float)
      expect(forecast_data[:current][:visibility]).to be_a(Integer)
      expect(forecast_data[:current][:weather][:icon]).to be_a(String)
      expect(forecast_data[:current][:weather][:main]).to be_a(String)
      expect(forecast_data[:current][:weather][:descrption]).to be_a(String)


      # time
      # temperature
      # conditions
      # icon
      expect(forecast_data[:hourly][0][:weather]).to be_a(Array)
      
      # date
      # sunrise
      # sunset
      # max_temp
      # min_temp
      # conditions
      # icon
      expect(forecast_data[:daily]).to be_a(Array)
      expect(forecast_data[:daily][0][:dt]).to be_a(Integer)

      expect(forecast_data[:daily][0][:sunrise]).to be_a(Integer)
      expect(forecast_data[:daily][0][:sunset]).to be_a(Integer)

      expect(forecast_data[:daily][0][:temp]).to be_a(Hash)
      expect(forecast_data[:daily][0][:temp][:max]).to be_a(Float)
      expect(forecast_data[:daily][0][:temp][:min]).to be_a(Float)
    
      expect(forecast_data[:daily][0][:weather]).to be_a(Array)
      expect(forecast_data[:daily][0][:weather][0]).to be_a(Hash)
      expect(forecast_data[:daily][0][:weather][0][:main]).to be_a(String)
      expect(forecast_data[:daily][0][:weather][0][:descrption]).to be_a(String)
      expect(forecast_data[:daily][0][:weather][0][:icon]).to be_a(String)
    end
  end
end

      #current_weather attrs
      #daily_weather attrs
      #hourly_weather attrs