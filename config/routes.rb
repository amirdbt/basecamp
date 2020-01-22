Rails.application.routes.draw do
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/login'
  # get 'sessions/welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # post "topic", to: "topics#begin_thread"
  resources :users do
    resources :projects do
      resources :project_users
      resources :topics do
        resources :messages
      end
    end
  end
 
  resources :sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'logout', to: 'sessions#destroy'
  get "admin", to: 'users#makeAdmin'
  get 'projects', to: 'projects#all_projects'
  get 'shared_projects', to: 'users#shared_projects'
  
  root "sessions#welcome"
end
