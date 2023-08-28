# frozen_string_literal: true
Rails.application.routes.draw do

  get "/articles", to:"articles#index"
end
