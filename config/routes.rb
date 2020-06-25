Rails.application.routes.draw do
  get '/admin/login', to: 'admin/sessions#new'
  post '/admin/login', to: 'admin/sessions#create'
  get '/admin/welcome', to: 'admin/sessions#welcome'
  get '/admin/new', to: 'admin/admin#new', as: :admin
  post '/admin/new', to: 'admin/admin#create'
  delete '/admin/logout', to: 'admin/sessions#destroy'
  get '/admin/home', to: 'admin/admin#show'

  namespace :user do
    resources :user
    resources :session
    resources :ingredient, :recipe_and_ingredient, :search
    resources :recipe do
      resources :comment, :recipe_and_rate
    end
  end

  namespace :admin do
    resources :recipe, :ingredient, :user, :category, :admin, :session
  end
end
