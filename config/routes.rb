Rails.application.routes.draw do
  namespace :user do
    resources :rec_category do
      collection do
        get '/search', to: 'rec_category#search'
      end
    end
    resources :session do
      collection do
        post 'new', to: 'session#create'
      end
    end
    resources :recipe_and_ingredient do 
      collection do
        get '/search', to: 'recipe_and_ingredient#search'
      end
    end
    resources :ingredient, :user, :ingre_category
    resources :search, only: [:create, :index]
    resources :recipe do
      resources :comments, only: %i[create destroy]
      resources :recipe_and_rate, only: %i[create destroy]
    end
  end

  namespace :admin do
    resources :recipe, :ingredient, :user, :ingre_category, :admin, :rec_category
    resources :session do
      collection do
        post 'new', to: 'session#create'
      end
    end
  end
end
