module BookServices
  #https://openlibrary.org/search.json?title=
  def self.get_books_for_location(location, limit)
    response = Faraday.get("https://openlibrary.org/search.json?title=#{location}&limit=#{limit}")
    JSON.parse(response.body, symbolize_names: true)
  end
end