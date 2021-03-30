Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit]
  resources :users, only:[:show, :edit, :update, :index]
  get 'home/about', to: 'homes#show'
  post 'users/:id' => 'books#create'
  post 'users' => 'books#create'
  get 'books' => 'users#show'
end
