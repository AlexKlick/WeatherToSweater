require 'rails_helper'

RSpec.describe 'Book Services' do
  describe 'get_books_for_location(location)' do
    it 'returns books that reference the location' do
      location = "minneapolis,Mn"
      books = BookServices.get_books_for_location(location)
      books[:docs][0][:title].include?("Minneapolis")
      expect(books[:docs][0][:title]).to include("Minneapolis")
      expect(books[:docs][-1][:title]).to include("Minneapolis")
    end
  end
end