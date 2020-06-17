Rails.application.routes.draw do
  namespace :admin do
    resources :recipe, :ingredient, :user, :category
  end
end
