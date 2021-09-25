require 'rails_helper'

RSpec.describe Api::V1::SessionsController do
  describe 'Create' do
    it 'creates a User session, logging in the user' do
      #create user
      post "/api/v1/users",
      params: {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
      }
      expect(session).to eq({})
      #login user
      post "/api/v1/sessions",
      params: {
        email: "whatever@example.com",
        password: "password"
      }
      #sessions updated with user_id
      expect(session).to eq({user_id: User.first.id})
    end
      
    it 'returns the correct data, formatted correctly' do
      #create user
      post "/api/v1/users",
      params: {
        email: "whatever@example.com",
        password: "password",
        password_confirmation: "password"
      }
      #login user
      post "/api/v1/sessions",
      params: {
        email: "whatever@example.com",
        password: "password"
      }
      #test response object
      res = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(res[:data]).to be_a(Hash)
      expect(res[:data][:type]).to be_a(String)
      expect(res[:data][:type]).to eq('users')
      expect(res[:data][:id]).to be_a(Integer)
      expect(res[:data][:id]).to eq(User.first.id)
      expect(res[:data][:attributes]).to be_a(Hash)
      expect(res[:data][:attributes][:email]).to be_a(String)
      expect(res[:data][:attributes][:email]).to eq('whatever@example.com')
      expect(res[:data][:attributes][:api_key]).to be_a(String)
    end
      
    describe 'Sad Paths' do
      it 'returns error when password is incorrect' do
        #create user
        post "/api/v1/users",
        params: {
          email: "whatever@example.com",
          password: "password",
          password_confirmation: "password"
        }
        #login user wrong password
        post "/api/v1/sessions",
        params: {
          email: "whatever@example.com",
          password: "paword"
        }
        res = JSON.parse(response.body, symbolize_names: true)
        expect(res).to eq("email and passwords don't match")
        expect(response.status).to eq(401)
      end

      it 'returns same error when email is incorrect' do
        #create user
        post "/api/v1/users",
        params: {
          email: "whatever@example.com",
          password: "password",
          password_confirmation: "password"
        }
        #login user wrong password
        post "/api/v1/sessions",
        params: {
          email: "whaatever@example.com",
          password: "password"
        }
        res = JSON.parse(response.body, symbolize_names: true)
        expect(res).to eq("email and passwords don't match")
        expect(response.status).to eq(401)
      end
    end
  end
end