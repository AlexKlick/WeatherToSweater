module BookSearchSerializer
  def self.serialize(forecast_data, book_data, location, count)
    serial_hash = {}
    serial_hash[:data] = {}
    serial_hash[:data][:id] = nil
    serial_hash[:data][:type] = 'books'
    serial_hash[:data][:attributes] = {}
    serial_hash[:data][:attributes][:destination] = location
    serial_hash[:data][:attributes][:forecast] = {}
    serial_hash[:data][:attributes][:forecast][:summary] = forecast_data[:current][:weather][0][:description]
    serial_hash[:data][:attributes][:forecast][:temperature] = "#{forecast_data[:current][:temp]} °F"
    serial_hash[:data][:attributes][:total_books_found] = book_data[:numFound]
    serial_hash[:data][:attributes][:books] = []

    book_data[:docs].each do |book, i|
      binding.pry
      serial_hash[:data][:attributes][:books][:isbn] = []
      serial_hash[:data][:attributes][:books][:title] = []
      serial_hash[:data][:attributes][:books][:publisher] = []
      if 
        serial_hash[:data][:attributes][:books] << book
      end
    end
  end
end