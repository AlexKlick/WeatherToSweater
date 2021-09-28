require 'rails_helper'

RSpec.describe Api::V1::RoadTripController do
  before {User.create(email:"abctest@test.com",password:"password", api_key: "api_key_test")}
  describe 'Create' do
    it 'takes in a Road Trip data object and creates a road trip' do
      post '/api/v1/sessions?email=abctest@test.com&password=password'
      res = Oj.load(response.body, :symbol_keys => true)
      controller.session[:user_id] = User.first.id
        #create road trip
        controller.session[:user_id] = User.first.id
        post "/api/v1/road_trip", :params => { road_trip: {origin: "Denver,CO", destination: "Pueblo,CO", api_key: User.first.api_key} }
    end
  end
end