Rails.application.routes.draw do

  resources :ingredient

  root 'ingredient#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
