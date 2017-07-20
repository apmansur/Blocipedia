Rails.application.routes.draw do

 resources :charges, only: [:new, :create]

  resources :wikis do
    resources :collaborators, only: [:new, :create, :destroy]
  end

 
 resources :collaborators

 

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations'}
  devise_scope :user do 
     get 'users/downgrade', to: 'users/registrations#downgrade'
   end
 
  
  
  get 'welcome/about'
  
  
    root 'welcome#index'


end
