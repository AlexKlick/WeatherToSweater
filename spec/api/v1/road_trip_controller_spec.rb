require 'rails_helper'

RSpec.describe Api::V1::RoadTripController do
  before {User.create(email:"abctest@test.com",password:"password", api_key: "api_key_test")}
  before {}
  describe 'Create' do
    setup { sign_in_as 'abctest' }
    it 'takes in a Road Trip data object and creates a road trip' do
      post '/api/v1/sessions?email=abctest@test.com&password=password'
      binding.pry
    
      res = JSON.parse(response.body, symbolize_names: true)

      controller.session[:user_id] = User.first.id
        #create road trip
        body = {
                origin: "Denver,CO",
                destination: "Pueblo,CO",
                api_key: User.first.api_key
               }
        post "/api/v1/road_trip"
        controller.session[:user_id] = User.first.id
        post "/api/v1/road_trip", 
        params: {
          origin: "Denver,CO",
          destination: "Pueblo,CO",
          api_key: User.first.api_key
         }
        binding.pry
    end
  end
end