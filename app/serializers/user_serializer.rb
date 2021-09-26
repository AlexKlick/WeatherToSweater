class UserSerializer
  include JSONAPI::Serializer

  def self.serialize(user_data)
    serial_hash = {}
    serial_hash[:data] = {}
    serial_hash[:data][:type] = "users"
    serial_hash[:data][:id] = user_data.id
    serial_hash[:data][:attributes] = {}
    serial_hash[:data][:attributes][:email] = user_data.email
    serial_hash[:data][:attributes][:api_key] = user_data.api_key
    serial_hash
  end

end