Rails.application.routes.draw do

  root 'home#home'
  get 'about', to: 'home#about'
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

end
