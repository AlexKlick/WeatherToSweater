module BookSearchFacade
  def self.get_forecast(location)
    ForecastFacade.gather_forecast_data(location)
  end

  def self.initialize_book_search(location, limit)
    forecast_data = get_forecast(location)
    book_data = BookServices.get_books_for_location(location, limit)
    BookSearchSerializer.serialize(forecast_data, book_data, location)
  end
end