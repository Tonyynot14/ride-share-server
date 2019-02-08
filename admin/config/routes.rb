Rails.application.routes.draw do

  mount API::Base, at: "/"

  get 'welcome/index'

  resources :drivers
  resources :riders


  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
