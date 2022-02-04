Rails.application.routes.draw do
  get 'employees/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "employees#index"

  resources :employees

end
