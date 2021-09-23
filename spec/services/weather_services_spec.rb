require 'rails_helper'

RSpec.describe 'WeathersController' do
  before(:each) do  
    GET "/api/v1/forecast?location=denver,co"
    res = JSON.parse(response.body, symbolize_names: true)
  end
  describe 'index' do
    it 'returns data in correct format' do
      expect(response.body).to be_a(JSON)
      expect(res[:data]).to be_a(HASH)
      expect(res[:data][:id]).to eq(nil)
      expect(res[:data][:type]).to eq('forecast')
      expect(res[:data][:attributes]).to be_a(HASH)
      expect(res[:data][:attributes].length).to eq(3)
      expect(res[:data][:attributes][:current_weather]).to be_a(HASH) 
      expect(res[:data][:attributes][:daily_weather]).to be_a(ARRAY) 
      expect(res[:data][:attributes][:hourly_weather]).to be_a(ARRAY) 
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
