# == Route Map
#

Rails.application.routes.draw do
  root 'post#index'
  get 'post/index'
  get 'post/new'
  post 'post/create'
  get '/post/:id', to: 'post#show', as: 'post'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
