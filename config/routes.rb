Rails.application.routes.draw do

  get 'toppages/index'


  
  root to: "toppages#index"
  

  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'


  
  
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  
  resources :tasks
end
