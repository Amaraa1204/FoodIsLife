Rails.application.routes.draw do
  namespace :user do
    resources :user
    resources :session do
      collection do
        post 'new', to: 'session#create'
      end
    end
    resources :ingredient, :recipe_and_ingredient
    resources :search, only: [:create] do
      collection do
        get '/', to: 'search#show'
      end
    end
    resources :recipe do
      resources :comment, :recipe_and_rate
    end
  end

  namespace :admin do
    resources :recipe, :ingredient, :user, :rec_category, :ingre_category, :admin
    resources :session do 
      collection do
        post 'new', to: 'session#create'
      end
    end
  end
end
end
