Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/about", to: "pages#about", as: :about
  resources :recipes do
    resources :notes, only: %i[new create show edit update]
    collection do
      get 'ai/new', to: 'recipes#ai_new', as: 'ai_new'
      post 'ai', to: 'recipes#ai_create', as: 'ai_create'
    end
  end
  get 'ai_chef', to: 'pages#ai_chef', as: 'ai_chef'
  get 'ai_answer', to: 'pages#ai_answer', as: 'ai_answer'
  post 'ai_answer', to: 'pages#ai_answer'
  get 'new_ai_tip', to: 'recipes#new_ai_tip', as: 'new_ai_tip'
  resources :categories
end
# resources :notes, only: %i[show edit update]
# Defines the root path route ("/")
# root "posts#index"
