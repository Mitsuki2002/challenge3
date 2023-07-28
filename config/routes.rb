Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'
  devise_for :users
  root to: "homes#top"
  get "/home/about" => "homes#about", as: "about"
  
  resources :books 

  resources :users
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # resources :books, only: [:index, :show]
  # get "home/about"=>"homes#about"
  # root to: "homes#top"
  # devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
