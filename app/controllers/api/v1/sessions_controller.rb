class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user == nil
      render json: "email and passwords don't match".to_json, status: 401
    else
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        serial_hash = {}
        serial_hash[:data] = {}
        serial_hash[:data][:type] = "users"
        serial_hash[:data][:id] = user.id
        serial_hash[:data][:attributes] = {}
        serial_hash[:data][:attributes][:email] = user.email
        serial_hash[:data][:attributes][:api_key] = user.api_key
        render json: serial_hash, status: 201
      else
        render json: "email and passwords don't match".to_json, status: 401
      end
    end
  end
end