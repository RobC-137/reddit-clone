# == Route Map
#

Rails.application.routes.draw do
  root 'post#index'
  get '/post/:id', to: 'post#show', as: 'post'
  get 'post/index'
  get 'post/new'
  post 'post/create'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
