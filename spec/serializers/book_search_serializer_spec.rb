require 'rails_helper'

RSpec.describe 'BookSearchSerializer' do
  describe 'serialize()' do
    it 'takes in forecast_data, books_data and returns a hash for rendering' do
      location = "Denver,co"
      forecast_data = BookSearchFacade.get_forecast(location)
      count = 5
      book_data = BookServices.get_books_for_location(location, count)
      serialized_hash = BookSearchSerializer.serialize(forecast_data, book_data, location)

      expect(serialized_hash[:data]).to be_a(Hash)
      expect(serialized_hash[:data][:id]).to eq(nil)
      expect(serialized_hash[:data][:attributes]).to be_a(Hash)
      expect(serialized_hash[:data][:attributes][:forecast]).to be_a(Hash)
      expect(serialized_hash[:data][:attributes][:forecast][:summary]).to be_a(String)
      expect(serialized_hash[:data][:attributes][:forecast][:temperature].split(' ')[0]).to be_a(String)
      expect(serialized_hash[:data][:attributes][:forecast][:temperature].split(' ')[0].to_f.to_s).to eq(serialized_hash[:data][:attributes][:forecast][:temperature].split(' ')[0]) #test is actual float
      expect(serialized_hash[:data][:attributes][:forecast][:temperature].split(' ')[1]).to eq('°F')
      expect(serialized_hash[:data][:attributes][:total_books_found]).to be_a(Integer)
      expect(serialized_hash[:data][:attributes][:books]).to be_a(Array)
      expect(serialized_hash[:data][:attributes][:books][0]).to be_a(Hash)
      expect(serialized_hash[:data][:attributes][:books][0][:isbn])
      expect(serialized_hash[:data][:attributes][:books][0][:title][0]).to be_a(String)
      expect(serialized_hash[:data][:attributes][:books][0][:publisher]).to be_a(Array)
      expect(serialized_hash[:data][:attributes][:books][0][:publisher][0]).to be_a(String)
      
      expect(serialized_hash[:data][:type]).to eq("books") #type = books
      expect(serialized_hash[:data][:attributes][:destination]).to eq("Denver,co") #destination = location
      expect(serialized_hash[:data][:attributes][:books].length).to eq(count) #books_found = count

    end
  end
end