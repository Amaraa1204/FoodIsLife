Rails.application.routes.draw do

  get 'admin/show'
  namespace :admin do
    resources :recipe, :ingredient, :user, :category
  end
  root 'admin#show'
end
