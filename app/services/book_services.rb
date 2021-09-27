module BookServices
  #https://openlibrary.org/search.json?title=
  def self.get_books_for_location(location)
    response = Faraday.get("https://openlibrary.org/search.json?title=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end
end