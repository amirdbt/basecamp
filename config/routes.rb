Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/login'
  # get 'sessions/welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :projects
  end
  # resources :projects
  resources :sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'logout', to: 'sessions#destroy'

  # get project_path to: 'users#new'

  root "sessions#welcome"
end
