Rails.application.routes.draw do
  namespace :admin do
    resources :recipe, :ingredient
  end
  resources :category
  resources :admin
end
