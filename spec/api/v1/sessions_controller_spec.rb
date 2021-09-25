require 'rails_helper'

RSpec.describe Api::V1::SessionsController do
  describe 'Create' do
    it 'creates a User session, logging in the user' do
      post "/api/v1/sessions",
      params: {
        email: "whatever@example.com",
        password: "password"
      }
      binding.pry
      res = JSON.parse(response.body, symbolize_names: true)
    end

    describe 'Sad Paths' do
      
    end
  end
end