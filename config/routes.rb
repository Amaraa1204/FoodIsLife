Rails.application.routes.draw do
  get '/admin/login', to: 'admin/sessions#new'
  post '/admin/login', to: 'admin/sessions#create'
  get '/admin/welcome', to: 'admin/sessions#welcome'
  get '/admin/new', to: 'admin/admin#new', as: :admin
  post '/admin/new', to: 'admin/admin#create'
  get '/admin/authorized', to: 'admin/sessions#login'
  delete '/admin/logout', to: 'admin/sessions#destroy'
  get '/admin/home', to: 'admin/admin#show'


  get '/user/login', to: 'user/session#new'
  post '/user/login', to: 'user/session#create'
  get '/user/welcome', to: 'user/session#welcome'
  get '/user/new', to: 'user/user#new', as: :user
  post '/user/new', to: 'user/user#create'
  get '/user/authorized', to: 'user/session#login'
  delete '/user/logout', to: 'user/session#destroy'
  get '/user/home', to: 'user/user#home'
  namespace :user do
    resources :user, :session, :ingredient; :recipe_and_ingredient
    resources :recipe do
      resources :comment, :recipe_and_rate
    end 
  end

  namespace :admin do
    resources :recipe, :ingredient, :user, :category, :admin, :sessions
  end
end
