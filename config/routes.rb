Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :articles, only: [:index, :create, :new, :destroy, :edit, :update]
end
