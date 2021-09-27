class Api::V1::BackgroundsController < ApplicationController
  def index
    render json: PictureFacade.initialize_background_phtoto(params[:location]).to_json
  end
end