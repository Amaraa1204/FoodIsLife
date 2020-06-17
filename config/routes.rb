Rails.application.routes.draw do
  get 'admin/show'
  namespace :admin do
    resources :recipe
  end
  root 'admin#show'
end
