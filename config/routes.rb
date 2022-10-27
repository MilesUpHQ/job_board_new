require 'sidekiq/web'

Rails.application.routes.draw do
  
  get 'errors/not_found'
  get 'errors/internal_server_error'
  
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  resources :jobs 
  resources :applies   
    # get'/', to: 'applies#accept', as: 'accept'
  # end   
   
    
 

  root to: 'jobs#index'

  # post '/applies', to: 'applies#accept', as: 'accept'
  # post '/job_board1/apply', to: 'apply#reject', as: 'reject'
  
  devise_for :users, controllers: {registrations: 'registrations'}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
