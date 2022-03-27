Rails.application.routes.draw do
  devise_for :users
  resources :mains
  resources :publishers
  resources :sakusyas
  resources :titles
  get 'top/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  # Defines the root path route ("/")
  root "top#index"
end
