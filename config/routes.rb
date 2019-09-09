Rails.application.routes.draw do
  
  devise_for :users
  root 'blogs#index'
<<<<<<< Updated upstream
  resources :users
  resources :blogs
=======
  resources :blogs , only:[:index,:new,:create]
>>>>>>> Stashed changes

end
