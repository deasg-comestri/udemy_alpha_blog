Rails.application.routes.draw do

  root 'home#home'
  get 'about', to: 'home#about'
  resources :articles, only: [:show, :index, :new, :create, :edit, :update]

end
