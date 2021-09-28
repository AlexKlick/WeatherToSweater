require 'rails_helper'

RSpec.describe 'Book Services' do
  before(:each) do    
    @location = "minneapolis,Mn"
    @limit = 5
    @books = BookServices.get_books_for_location(@location, @limit)
  end
  describe 'get_books_for_location(location, limit)' do
    it 'returns books that reference the location' do
      expect(@books[:docs][0][:title]).to include("Minneapolis")
      expect(@books[:docs][-1][:title]).to include("Minneapolis")
    end
    
    it 'returns the number of books equal to or lower than (if total books is less than limit) limit' do
      expect(@books[:docs].length).to eq(@limit)
    end
  end
end