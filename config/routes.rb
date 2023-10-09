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

  resources :topics do
    resources :posts do
    resources :comments
    resources :ratings, shallow: true
    end
  end

end
