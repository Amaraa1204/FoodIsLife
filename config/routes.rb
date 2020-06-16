Rails.application.routes.draw do
  get 'ingredient/new'

  resources :ingredient

  root 'ingredient#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
