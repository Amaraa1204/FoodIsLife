Rails.application.routes.draw do
  namespace :admin do
    resources :recipe, :ingredient
  end
  #get 'admin/ingredient/index'

  #root 'admin#ingredient#index'
end
