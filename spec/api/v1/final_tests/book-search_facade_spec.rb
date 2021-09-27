require 'rails_helper'

RSpec.describe 'BookSearchFacade' do
  describe 'get_forecast(location)' do
    it 'takes in a location and returns the current forecast data for that location' do
      location = 'Detroit,MI'
      forecast = BookSearchFacade.get_forecast(location)
      expect(forecast[:timezone]).to eq("America/Detroit")
      expect(forecast[:current]).to be_a(Hash)
      expect(forecast[:current][:temp]).to be_a(Float)
      expect(forecast[:current][:weather]).to be_a(Array)
      expect(forecast[:current][:weather][0][:description]).to be_a(String)
    end
  end
  
  describe 'initialize_book_search(location, limit)' do
    it 'recieves location and limit for search results and returns a hash with the serialized data' do
      location = 'new York, ny'
      limit = 12
      results = BookSearchFacade.initialize_book_search(location, limit)

      expect(results[:data]).to be_a(Hash)
      expect(results[:data][:id]).to eq(nil)
      expect(results[:data][:attributes]).to be_a(Hash)
      expect(results[:data][:attributes][:forecast]).to be_a(Hash)
      expect(results[:data][:attributes][:forecast][:summary]).to be_a(String)
      expect(results[:data][:attributes][:forecast][:temperature].split(' ')[0]).to be_a(String)
      expect(results[:data][:attributes][:forecast][:temperature].split(' ')[0].to_f.to_s).to eq(results[:data][:attributes][:forecast][:temperature].split(' ')[0]) #test is actual float
      expect(results[:data][:attributes][:forecast][:temperature].split(' ')[1]).to eq('°F')
      expect(results[:data][:attributes][:total_books_found]).to be_a(Integer)
      expect(results[:data][:attributes][:books]).to be_a(Array)
      expect(results[:data][:attributes][:books][0]).to be_a(Hash)
      expect(results[:data][:attributes][:books][0][:isbn])
      expect(results[:data][:attributes][:books][0][:title][0]).to be_a(String)
      expect(results[:data][:attributes][:books][0][:publisher]).to be_a(Array)
      expect(results[:data][:attributes][:books][0][:publisher][0]).to be_a(String)
      
      expect(results[:data][:type]).to eq("books") 
      expect(results[:data][:attributes][:destination]).to eq(location) 
      expect(results[:data][:attributes][:books].length).to eq(limit) 
    end
  end
end