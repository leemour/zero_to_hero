Rails.application.routes.draw do
  root "articles#index"

  devise_for :users

  mount API::Base => "/api"
  mount GrapeSwaggerRails::Engine => "/swagger"

  # resources :users, only: %i[index show]

  # resources :articles do
  #   resources :comments, shallow: true, only: %i[create destroy]
  # end

  # resources :pages do
  #   resources :comments, only: %i[create destroy]
  # end

  # resource :friendships, :only => [:create, :destroy]
end
