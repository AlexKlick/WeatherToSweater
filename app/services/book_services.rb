module BookServices
  #https://openlibrary.org/search.json?title=
  def self.get_books_for_location(location, limit)
    response = Faraday.get("https://openlibrary.org/search.json?title=#{location}&limit=#{limit}")
    Oj.load(response.body, :symbol_keys => true)
  end
end