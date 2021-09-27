require 'rails_helper'

RSpec.describe 'BookSearchSerializer' do
  describe 'serialize()' do
    it 'takes in forecast_data, books_data and returns a hash for rendering' do
      location = "Denver,co"
      forecast_data = BookSearchFacade.get_forecast(location)
      book_data = BookServices.get_books_for_location(location)
      count = 5
      serialized_hash = BookSearchSerializer.serialize(forecast_data, book_data, location)
      expect(serialized_hash[:data]).to be_a(Hash)
      expect(serialized_hash[:data][:id]).to eq(nil)
      expect(serialized_hash[:data][:attributes]).to be_a(Hash)
      expect(serialized_hash[:data][:attributes][:forecast]).to be_a(Hash)
      expect(serialized_hash[:data][:attributes][:forecast][:summary]).to be_a(String)
      expect(serialized_hash[:data][:attributes][:forecast][:temperature]).to be_a(Float)
      expect(serialized_hash[:data][:attributes][:total_books_found]).to be_a(Integer)
      expect(serialized_hash[:data][:attributes][:books]).to be_a(Array)
      expect(serialized_hash[:data][:attributes][:books][0]).to be_a(Hash)
      expect(serialized_hash[:data][:attributes][:books][0][:isbn]).to be_a(Array)
      expect(serialized_hash[:data][:attributes][:books][0][:isbn][0]).to be_a(String)
      expect(serialized_hash[:data][:attributes][:books][0][:title]).to be_a(String)
      expect(serialized_hash[:data][:attributes][:books][0][:publisher]).to be_a(String)

      expect(serialized_hash[:data][:type]).to eq("books") #type = books
      expect(serialized_hash[:data][:attributes][:destination]).to eq("Denver,co") #destination = location
      expect(serialized_hash[:data][:attributes][:books].length).to eq(serialized_hash[:data][:attributes][:total_books_found]) #books_found = books (array) length


    end
  end
end