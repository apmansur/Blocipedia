Rails.application.routes.draw do

 resources :charges, only: [:new, :create]

 resources :wikis
 

  devise_for :users, controllers: { sessions: 'users/sessions'}
  get 'welcome/about'
  
   root 'welcome#index'


end
