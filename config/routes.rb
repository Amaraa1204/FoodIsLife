Rails.application.routes.draw do
  namespace :user do
    resources :user
    resources :session
    resources :ingredient, :recipe_and_ingredient, :search
    resources :recipe do
      resources :comment, :recipe_and_rate
    end
  end

  namespace :admin do
    resources :recipe, :ingredient, :user, :category, :admin
    resources :session do
    collection do
      post 'new', to: 'session#create'
    end
  end
end
end