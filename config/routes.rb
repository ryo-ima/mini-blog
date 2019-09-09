Rails.application.routes.draw do
  
  root 'blogs#index'
  resources :users
  resources :blogs

end
