require 'rails_helper'

RSpec.describe 'ForecastsController' do
  before(:each) do  
    get "/api/v1/forecast?location=denver,co"
    res = JSON.parse(response.body, symbolize_names: true)
  end
  describe 'index' do
    it 'returns data in correct format' do
      expect(response.body).to be_a(Json)
      expect(res[:data]).to be_a(Hash)
      expect(res[:data][:id]).to eq(nil)
      expect(res[:data][:type]).to eq('forecast')
      expect(res[:data][:attributes]).to be_a(Hash)
      expect(res[:data][:attributes].length).to eq(3)
      expect(res[:data][:attributes][:current_weather]).to be_a(Hash) 
      expect(res[:data][:attributes][:daily_weather]).to be_a(Array) 
      expect(res[:data][:attributes][:hourly_weather]).to be_a(Array) 
    end

    it 'returns the attrs and their sub-attrs' do

      #current_weather attrs
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
      #daily_weather attrs
      # date
      # sunrise
      # sunset
      # max_temp
      # min_temp
      # conditions
      # icon
      #hourly_weather attrs
      # time
      # temperature
      # conditions
      # icon
    end
  end
end
