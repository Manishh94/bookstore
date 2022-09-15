Rails.application.routes.draw do
  resources :courses do
    member do
      get :students
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users

  root to: 'users#index'
end
