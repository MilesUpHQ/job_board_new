require 'sidekiq/web'

Rails.application.routes.draw do

   get 'errors/not_found'
   get 'errors/internal_server_error'

   match "/404", to: "errors#not_found", via: :all
   match "/500", to: "errors#internal_server_error", via: :all

   get '/jobs/:job_id/job_applications/rejected', to: 'job_applications#rejected', as: 'rejected'
   get '/jobs/:job_id/job_applications/accepted', to: 'job_applications#accepted', as: 'accepted'

  resources :jobs do
    resources :job_applications
  end
   post '/jobs/:job_id/job_applications/:id/accept', to: 'job_applications#accept', as: 'accept'
   post '/jobs/:job_id/job_applications/:id/reject', to: 'job_applications#reject', as: 'reject'


  root to: 'jobs#index'

  devise_for :users, controllers: {registrations: 'registrations'}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
