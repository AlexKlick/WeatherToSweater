require 'rails_helper'

RSpec.describe 'Book Services' do
  describe 'get_books_for_location(location)' do
    it 'returns books that reference the location' do
      location = "minneapolis,Mn"
      books = BookServices.get_books_for_location(location)
      books = JSON.parse(books.body, symbolize_names: true)
      binding.pry
      expect(books[0]).to eq(content)
    end
  end
end