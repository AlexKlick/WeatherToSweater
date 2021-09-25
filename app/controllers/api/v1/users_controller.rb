class Api::V1::UsersController < ApplicationController
  def create
    user = User.find_by(email: user_params[:email])
    if user == nil
      if user_params[:password] != nil
        if user_params[:email] != nil
          user = User.new(user_params)
          user.save
          status = 201
          serial_hash = {}
          serial_hash[:data] = {}
          serial_hash[:data][:type] = "users"
          serial_hash[:data][:id] = user.id
          serial_hash[:data][:attributes] = {}
          serial_hash[:data][:attributes][:email] = user.email
          serial_hash[:data][:attributes][:api_key] = user.api_key
          render json: serial_hash.to_json, status: status
        else
          message = "Email appears to be missing"
          render json: message.to_json, status: 401
        end
      else
        status = 401
        message = "password and confirmation must match!"
        render json: message.to_json, status: status
      end
    else
      status = 401
      message = "User already exists"
      render json: message.to_json, status: status
    end
  end

  private

  def user_params
    if params[:password_confirmation] == params[:password]
      params[:user] = {}
      params[:user][:email] = params[:email]
      params[:user][:password] = params[:password_confirmation]
      api_key = SecureRandom.urlsafe_base64
      params[:user][:api_key] = api_key
    else
      params[:user] = {}
      params[:user][:password] = nil
    end
    params.require(:user).permit(:email, :password, :api_key)
  end
end