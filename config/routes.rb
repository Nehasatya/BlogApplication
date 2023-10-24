Rails.application.routes.draw do
  root :to => "homes#index"
  devise_for :users
  get 'tags/index'
  get 'tags/new'
  get 'tags/update'
  get 'tags/destroy'
  get 'tags/feature'
  get '/posts', to: 'posts#index'
  post '/change_read_status', to: 'posts#change_read_status'
  post '/create_rating', to: "comments#create_rating"
  get '/comments/:id/show_ratings', to: "comments#show_ratings"
  resources :topics do
    resources :posts do
    resources :comments do ||
      resources :ratings
    end
    resources :ratings
    end
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"


end
