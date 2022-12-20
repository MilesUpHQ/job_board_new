require 'sidekiq/web'

Rails.application.routes.draw do

   get 'errors/not_found'
   get 'errors/internal_server_error'

   match "/404", to: "errors#not_found", via: :all
   match "/500", to: "errors#internal_server_error", via: :all

  get "jobs/company_page"
  resources :jobs do
    resources :job_applications do
      collection do
      post 'accept'
      post 'reject'
      get 'accepted'
      get 'rejected'
  end
end
end
 

  root to: 'jobs#index'

  devise_for :users, controllers: {registrations: 'registrations'}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
