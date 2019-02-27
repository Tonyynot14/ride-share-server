Rails.application.routes.draw do

  mount API::Base, at: "/"
  mount GrapeSwaggerRails::Engine, at: "/documentation"

  get 'welcome/index'

  resources :drivers
  resources :riders
  resources :rides
  resources :organizations
  resources :tokens,  path_names: { new: 'new/:rider_id' }


  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
