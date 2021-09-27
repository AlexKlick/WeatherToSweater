module BookSearchSerializer
  def self.serialize(forecast_data, book_data, location)
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

    book_data[:docs].each_with_index do |book, i|
      serial_hash[:data][:attributes][:books] << {}
      if book[:isbn]
        serial_hash[:data][:attributes][:books][i][:isbn] = []
        book[:isbn].each do |isbn|
          serial_hash[:data][:attributes][:books][i][:isbn] << isbn
        end
      else
        serial_hash[:data][:attributes][:books][i][:isbn] = []
      end
      serial_hash[:data][:attributes][:books][i][:title] = book[:title]
      serial_hash[:data][:attributes][:books][i][:publisher] = []
      book[:publisher].each do |pub|
        serial_hash[:data][:attributes][:books][i][:publisher] << pub
      end
    end
    serial_hash
  end
end