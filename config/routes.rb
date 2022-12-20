require 'sidekiq/web'

Rails.application.routes.draw do

   get 'errors/not_found'
   get 'errors/internal_server_error'
   get 'jobs/recommended_jobs'

   match "/404", to: "errors#not_found", via: :all
   match "/500", to: "errors#internal_server_error", via: :all

   get '/jobs/:job_id/applies/rejected', to: 'applies#rejected', as: 'rejected'
   get '/jobs/:job_id/applies/accepted', to: 'applies#accepted', as: 'accepted'

  resources :jobs do
    resources :applies
  end
   post '/jobs/:job_id/applies/:id/accept', to: 'applies#accept', as: 'accept'
   post '/jobs/:job_id/applies/:id/reject', to: 'applies#reject', as: 'reject'



  root to: 'jobs#index'

  devise_for :users, controllers: {registrations: 'registrations'}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
