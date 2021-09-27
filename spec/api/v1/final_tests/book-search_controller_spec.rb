require 'rails_helper'

RSpec.describe 'BookSearch Controller' do
  describe 'index' do
    it 'renders the serialized book_search data to the client in json' do
      get '/api/v1/book-search?location=denver,co&quantity=5'
      res = JSON.parse(response.body,symbolize_names: true) #implicitly tests if JSON because if not, then it will error out
      expect(res).to be_a(Hash) # already tested twice that the hash being sent to controller is in the correct format with all data required present
    end
  end
end