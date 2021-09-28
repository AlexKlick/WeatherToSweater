require 'rails_helper'

RSpec.describe Api::V1::UsersController do
  describe 'create' do

    it 'allows new users to register' do
      #this is also tested in postman with login info in body, just couldn't figure this out for this test, so used params instead
      #it works in both cases
      expect(User.all).to eq([])
      post "/api/v1/users",
      params: {
        email: "whaatever@example.com",
        password: "password",
        password_confirmation: "password"
        }
<<<<<<< HEAD
      res = Oj.load(response.body, :symbol_keys => true)
=======
      res = JSON.parse(response.body, symbolize_names: true)
>>>>>>> 804e35a935bbaadbd22ef6512d0902b6d1675b51
      expect(res[:data][:attributes][:email]).to eq(User.first.email)
      expect(User.all.count).to eq(1)
    end

    it 'returns all of the required data, formatted correctly' do
      post "/api/v1/users",
      params: {
        email: "whaatever@example.com",
        password: "password",
        password_confirmation: "password"
        }
<<<<<<< HEAD
      res = Oj.load(response.body, :symbol_keys => true)
=======
      res = JSON.parse(response.body, symbolize_names: true)
>>>>>>> 804e35a935bbaadbd22ef6512d0902b6d1675b51
      expect(response.status).to eq(201)
      expect(res[:data]).to be_a(Hash)
      expect(res[:data][:type]).to be_a(String)
      expect(res[:data][:type]).to eq('users')
      expect(res[:data][:id]).to be_a(Integer)
      expect(res[:data][:id]).to eq(User.first.id)
      expect(res[:data][:attributes]).to be_a(Hash)
      expect(res[:data][:attributes][:email]).to be_a(String)
      expect(res[:data][:attributes][:email]).to eq('whaatever@example.com')
      expect(res[:data][:attributes][:api_key]).to be_a(String)
    end

    describe 'sad paths' do
      it 'returns error when confirmation password doesnt match' do
        post "/api/v1/users",
        params: {
          email: "whaatever@example.com",
          password: "password",
          password_confirmation: "pass"
          }
        
<<<<<<< HEAD
        res = Oj.load(response.body, :symbol_keys => true)
=======
        res = JSON.parse(response.body, symbolize_names: true)
>>>>>>> 804e35a935bbaadbd22ef6512d0902b6d1675b51
  
        expect(response.status).to eq(401)
        expect(res).to eq("password and confirmation must match!")
      end
  
      it 'returns error when user already exists with that email' do
  
        post "/api/v1/users",
        params: {
          email: "whatever@example.com",
          password: "password",
          password_confirmation: "password"
          }
  
        expect(response.status).to eq(201)
  
        post "/api/v1/users",
        params: {
          email: "whatever@example.com",
          password: "password",
          password_confirmation: "password"
          }
  
        res = Oj.load(response.body, :symbol_keys => true)
  
        expect(res).to eq("User already exists")
      end

      it 'returns error when email missing' do
        post "/api/v1/users",
        params: {
          password: "password",
          password_confirmation: "password"
          }
        
<<<<<<< HEAD
        res = Oj.load(response.body, :symbol_keys => true)
=======
        res = JSON.parse(response.body, symbolize_names: true)
>>>>>>> 804e35a935bbaadbd22ef6512d0902b6d1675b51
        expect(response.status).to eq(401)
        expect(res).to eq("Email appears to be missing")
      end
    end
  end

end