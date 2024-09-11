Rails.application.routes.draw do
  devise_for :users
  root to: "users#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :recipes, only: %i[index new create edit update destroy] do
    resources :notes, only: %i[index new create]
    collection do
      get 'ai/new', to: 'recipes#ai_new', as: 'ai_new'
      post 'ai', to: 'recipes#ai_create', as: 'ai_create'
    end
  end

  resources :categories, :recipe_categories, only: %i[index show new create edit update destroy]

  resources :notes, only: %i[show edit update]

end
# Defines the root path route ("/")
# root "posts#index"
