Rails.application.routes.draw do

  get 'tags/index'
  get 'tags/new'
  get 'tags/update'
  get 'tags/destroy'
  get 'tags/feature'
  get '/posts', to: 'posts#index'

  resources :topics do
    resources :posts do
    resources :comments, shallow: true
    resources :ratings, shallow: true
    end
  end

end
