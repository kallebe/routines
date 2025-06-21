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

  resources :users, only: [:create, :update, :destroy]
  resources :user_routines, only: [:index, :create, :show, :update, :destroy]
  resources :tasks, only: [:index, :create, :update, :destroy]
  resources :task_routines, only: [:create, :update, :destroy]
  resources :categories, only: [:create, :update, :destroy]
end
