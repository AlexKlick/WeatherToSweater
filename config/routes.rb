Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecast, only: :index
      resources :users, only: :create
      resources :sessions, only: :create
      resources :road_trip, only: :create
      resources :backgrounds, only: :index
      get '/book-search', to: 'book_search#index'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end