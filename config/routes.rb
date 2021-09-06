# == Route Map
#

Rails.application.routes.draw do
  root 'post#index'
  get 'comments/new'
  post 'comments/create'
  post 'votes/vote'
  get 'post/index'
  get 'post/new'
  post 'post/create'
  get '/post/:id', to: 'post#show', as: 'post'
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :users, path: "", controllers: { sessions: "users/sessions", registrations: "users/registrations" }, path_names: { sign_in: 'login', password: 'forgot', confirmation: 'confirm', unlock: 'unblock', sign_up: 'register', sign_out: 'signout'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
