require 'rails_helper'

RSpec.describe Api::V1::ForecastController do
  before(:each) do
  end
  it 'takes in a location params and returns the forecast for that city' do
    get "/api/v1/forecast?location=denver,co"
    res = JSON.parse(response.body, symbolize_names: true)
    expect(res[:data][:id]).to eq(nil)
    expect(res[:data][:type]).to eq('forecast')
    expect(res[:data][:attributes][:current_weather]).to be_a(Hash)
    expect(res[:data][:attributes][:current_weather][:datetime]).to be_a(String)
    expect(res[:data][:attributes][:current_weather][:sunrise]).to be_a(String)
    expect(res[:data][:attributes][:current_weather][:sunset]).to be_a(String)
    expect(res[:data][:attributes][:current_weather][:temperature]).to be_a(Float)
    expect(res[:data][:attributes][:current_weather][:feels_like]).to be_a(Float)
    expect(res[:data][:attributes][:current_weather][:humidity]).to be_a(Integer)
    expect(res[:data][:attributes][:current_weather][:uvi]).to be_a(Float)
    expect(res[:data][:attributes][:current_weather][:visibility]).to be_a(Integer)
    expect(res[:data][:attributes][:current_weather][:conditions]).to be_a(String)
    expect(res[:data][:attributes][:current_weather][:icon]).to be_a(String)


    #hourly weather format
    expect(res[:data][:attributes][:hourly_weather][0][:time]).to be_a(String)
    expect(res[:data][:attributes][:hourly_weather][0][:temp]).to be_a(Float)
    expect(res[:data][:attributes][:hourly_weather][0][:conditions]).to be_a(String)
    expect(res[:data][:attributes][:hourly_weather][0][:icon]).to be_a(String)

    #daily weather
    expect(res[:data][:attributes][:daily_weather]).to be_a(Array)
    expect(res[:data][:attributes][:daily_weather][0][:date]).to be_a(String)
    expect(res[:data][:attributes][:daily_weather][0][:sunrise]).to be_a(String)
    expect(res[:data][:attributes][:daily_weather][0][:sunset]).to be_a(String)
    expect(res[:data][:attributes][:daily_weather][0][:max_temp]).to be_a(Float)
    expect(res[:data][:attributes][:daily_weather][0][:min_temp]).to be_a(Float)
    expect(res[:data][:attributes][:daily_weather][0][:conditions]).to be_a(String)
    expect(res[:data][:attributes][:daily_weather][0][:icon]).to be_a(String)
  end
end
