module PictureSerializer
  def self.serialize(picture, location)
    payload = {}
    payload[:data] = {}
    payload[:data][:id] = nil
    payload[:data][:type] = "image"
    payload[:data][:attributes] = {}
    payload[:data][:attributes][:location] = location
    payload[:data][:attributes][:image_url] = picture
    Oj.dump(payload)
  end
end