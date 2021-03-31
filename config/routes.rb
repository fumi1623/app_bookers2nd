Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only:[:show, :edit, :update, :index,]
  get 'home/about', to: 'homes#show'

  get 'books' => 'users#show'
  post 'books/:id/edit' => 'books#edit'

  post 'users/:id' => 'books#create'
  post 'users' => 'books#create'

  get 'users/:id/edit' => 'users#edit'
  patch 'users/:id' => 'users#update'
end
