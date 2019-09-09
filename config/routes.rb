Rails.application.routes.draw do
  
  devise_for :users
  root 'blogs#index'
  resources :users
  resources :blogs

end
