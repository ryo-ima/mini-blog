Rails.application.routes.draw do
  
  devise_for :users
  root 'blogs#index'
  resources :blogs , only:[:index,:new,:create]

end
