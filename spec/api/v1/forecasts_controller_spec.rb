require 'rails_helper'

RSpec.describe 'Api::V1::ForecastController' do
  before(:each) do
  end
  it 'does' do
    get "/api/v1/forecast?location=denver,co"
    res = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end
end
