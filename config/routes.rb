Rails.application.routes.draw do

  get 'charges/create'

  get 'charges/new'

 resources :wikis
 

  devise_for :users, controllers: { sessions: 'users/sessions' }
  get 'welcome/about'
  
   root 'welcome#index'


end
