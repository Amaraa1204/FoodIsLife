Rails.application.routes.draw do
  get 'recipes/index'
  get 'recipes/new'
  get 'recipes/edit'
  get 'recipes/show'
  get '/admin/login', to: 'admin/sessions#new'
  post '/admin/login', to: 'admin/sessions#create'
  get '/admin/welcome', to: 'admin/sessions#welcome'
  get '/admin/new', to: 'admin/admin#new', as: :admin
  post '/admin/new', to: 'admin/admin#create'
  get '/admin/authorized', to: 'admin/sessions#login'


  get '/user/login', to: 'user/session#new'
  post '/user/login', to: 'user/session#create'
  get '/user/welcome', to: 'user/session#welcome'
  get '/user', to: 'user/user#home'
  get '/user/new', to: 'user/user#new', as: :user
  post '/user/new', to: 'user/user#create'
  get '/user/authorized', to: 'user/session#login'
  namespace :user do
    resources :user, :session, :recipes
  end

  namespace :admin do
    resources :recipe, :ingredient, :user, :category, :admin, :sessions
  end
end
