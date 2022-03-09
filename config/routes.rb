Rails.application.routes.draw do
  # get 'emails/index'
  get 'employees/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "employees#index"
  
  resources :employees

  # resources :emails
  
  get "/conditions", to: "emails#index"
  get "/email/home", to: "emails#index"
  get "/email", to: "emails#new"
  post "/email/home", to: "emails#create"

  #=========== orverriding conditions root ================
  get "/conditions/orverride", to: "emails#overriding_conditions"

  get "/batches/data", to: "emails#batches"
end
