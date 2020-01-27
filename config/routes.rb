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
      resources :tasks
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
  delete '/projects/:project_id/image/:image_id', :to => 'projects#delete_image_attachment', :method => 'delete'
  delete '/projects/:project_id', :to => 'project_users#user_destroy', :method => 'delete'
  # get 'users/:user_id/projects/:project_id/user_edit', :to=> 'projects#user_edit'
  # patch '/users/:user_id/projects/:project_id/', :to=> ''
  root "sessions#welcome"
end
