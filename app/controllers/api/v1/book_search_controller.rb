class Api::V1::BookSearchController < ApplicationController
  def index
    render json: BookSearchFacade.initialize_book_search(params[:location], params[:quantity]).to_json
  end

end