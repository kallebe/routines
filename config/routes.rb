Rails.application.routes.draw do
  devise_for :users,
              path: '',
              path_names: {
                sign_in: 'login',
                sign_out: 'logout'
              },
              controllers: {
                sessions: 'sessions'
              }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/profile', to: 'users#profile'
  resources :user_routines, only: [:index, :create, :update, :destroy]
  resources :tasks, only: [:index, :create, :update, :destroy]
end
